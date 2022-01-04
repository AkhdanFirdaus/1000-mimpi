import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';

import '../index.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState<bool>(false);
    final isValid2 = useState<bool>(false);
    final isVisible = useState<bool>(false);

    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SafeArea(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  isValid2.value = emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty;
                },
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(36, 60, 36, 36),
                  children: [
                    Row(
                      children: [
                        const BackButton(),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
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
                      textInputAction: TextInputAction.done,
                      obscureText: !isVisible.value,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            isVisible.value = !isVisible.value;
                          },
                          icon: isVisible.value
                              ? const Icon(Icons.lock_open)
                              : const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        onPressed: isValid2.value && !isLoading.value
                            ? () {
                                isLoading.value = true;
                                ref
                                    .read(userProvider.notifier)
                                    .loginUser(
                                      email: emailController.text,
                                      password: passwordController.text,
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
                            : const Text("Masuk"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: TextButton(
                        onPressed: () {
                          ref.read(userProvider.notifier).loginGuest(
                                firstName: "Akhdan",
                                lastName: "Firdaus",
                                role: 0,
                              );
                        },
                        child: const Text("Masuk Sebagai Tamu"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
