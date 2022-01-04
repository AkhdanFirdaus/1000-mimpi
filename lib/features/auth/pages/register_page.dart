import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/auth/index.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaController = useTextEditingController();
    final asalController = useTextEditingController();
    final telpController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVisible = useState<bool>(false);
    final isLoading = useState<bool>(false);
    final isValid = useState<bool>(false);

    AutoRouter.of(context);

    ref.listen<UserState>(userProvider, (prev, next) {
      next.map(
        userGuest: (userGuest) {},
        user: (value) {
          MotionToast.success(
            title: "Sukses Register",
            description: "Halo ${value.name}",
            toastDuration: const Duration(seconds: 2),
          ).show(context);
          Future.delayed(const Duration(seconds: 2), () {
            MotionToast.info(
              title: "Login Ulang",
              description: "Silahkan login ulang",
              toastDuration: const Duration(seconds: 2),
            ).show(context);
            Future.delayed(const Duration(seconds: 2), () {
              ref.read(userProvider.notifier).logout();
            });
          });
        },
        error: (error) {
          MotionToast.error(
            title: "Gagal Daftar",
            description: error.message,
            toastDuration: const Duration(seconds: 2),
          ).show(context);
        },
        unauthenticated: (_) {
          context.router.root.push(const AuthWrapperRoute());
        },
      );
    });

    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imgs/1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    isValid.value = namaController.text.isNotEmpty &&
                        asalController.text.isNotEmpty &&
                        telpController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty;
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(36, 60, 36, 36),
                    children: [
                      Row(
                        children: [
                          BackButton(
                            onPressed: () {
                              getIt<AppRouter>().pop();
                            },
                          ),
                          Text(
                            "Buat Akun",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: namaController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: asalController,
                        maxLines: null,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: "Asal"),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: telpController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: "No Telp"),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !passwordVisible.value,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              passwordVisible.value = !passwordVisible.value;
                            },
                            icon: !passwordVisible.value
                                ? const Icon(Icons.lock)
                                : const Icon(Icons.lock_open),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: const Text("Reset"),
                          ),
                          Builder(
                            builder: (context) => ElevatedButton(
                              onPressed: isValid.value && !isLoading.value
                                  ? () {
                                      isLoading.value = true;
                                      ref
                                          .read(userProvider.notifier)
                                          .registerUser(
                                            name: namaController.text,
                                            email: emailController.text,
                                            nomorTelp: telpController.text,
                                            password: passwordController.text,
                                            asal: asalController.text,
                                            role: 1,
                                          )
                                          .whenComplete(() {
                                        isLoading.value = false;
                                      });
                                    }
                                  : null,
                              child: isLoading.value
                                  ? SizedBox(
                                      width: sy(12),
                                      height: sy(12),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Submit"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
