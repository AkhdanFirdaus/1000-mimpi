import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:seribu_mimpi/features/auth/index.dart';

class HomeProfilePage extends HookConsumerWidget {
  const HomeProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showProfile(User user) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(text: user.name),
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    readOnly: true,
                    maxLines: null,
                    minLines: 4,
                    controller: TextEditingController(text: user.asal),
                    decoration: const InputDecoration(hintText: "Asal"),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(text: user.notelp),
                    decoration: const InputDecoration(hintText: "No Telp"),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(text: user.email),
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    final user = ref.watch(userProvider);
    final notification = useState<bool>(false);

    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        final List<Widget> widgets = user.map(
          userGuest: (guest) {
            return [
              Card(
                child: InkWell(
                  onTap: () {
                    getIt<AppRouter>().pushNamed('auth/register');
                  },
                  child: Container(
                    color: AppColor.pink,
                    height: sy(80),
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(
                      child:
                          Text("Anda tidak login, silahkan klik untuk daftar"),
                    ),
                  ),
                ),
              ),
            ];
          },
          user: (user) {
            return [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColor.purpleCalm,
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                onTap: () {
                  showProfile(user);
                },
              ),
              const SizedBox(height: 24),
              ListTile(
                onTap: () {},
                tileColor: Colors.grey.shade200,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                title: const Text(
                  "Notifikasi",
                ),
                trailing: Switch(
                  value: notification.value,
                  onChanged: (val) {
                    notification.value = !notification.value;
                  },
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                onTap: () {},
                tileColor: Colors.grey.shade200,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                title: const Text(
                  "Ubah Password",
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                onTap: () {},
                tileColor: Colors.grey.shade200,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                title: const Text(
                  "Bahasa",
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ];
          },
          eventOrganizer: (creator) {
            return [
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    color: AppColor.pink,
                    height: sy(80),
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(
                      child:
                          Text("Anda tidak login, silahkan klik untuk daftar"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          color: AppColor.pink,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                                "Anda tidak login, silahkan klik untuk daftar"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          color: AppColor.pink,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                                "Anda tidak login, silahkan klik untuk daftar"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
          error: (error) {
            return [
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    color: AppColor.pink,
                    height: sy(80),
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(
                      child:
                          Text("Anda tidak login, silahkan klik untuk daftar"),
                    ),
                  ),
                ),
              ),
            ];
          },
          unauthenticated: (unauthenticated) {
            return [];
          },
        );
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                ...widgets,
                const SizedBox(height: 24),
                ListTile(
                  onTap: () {},
                  tileColor: Colors.grey.shade200,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  title: const Text(
                    "Privasi",
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  onTap: () {},
                  tileColor: Colors.grey.shade200,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  title: const Text(
                    "Ketentuan",
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
                const SizedBox(height: 24),
                ListTile(
                  onTap: () {
                    getIt<AppRouter>().root.replace(const AuthWrapperRoute());
                  },
                  tileColor: Colors.pink,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
