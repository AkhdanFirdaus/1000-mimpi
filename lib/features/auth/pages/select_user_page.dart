import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';

class SelectUserPage extends StatelessWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imgs/1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Card(
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: sy(140),
                            height: sy(140),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Masuk ke aplikasi untuk melihat banyak mimpi",
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      getIt<AppRouter>().pushNamed('login');
                                    },
                                    child: const Text("Login"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Card(
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: sy(140),
                            height: sy(140),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Buat akun untuk menggapai mimpi",
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      getIt<AppRouter>().pushNamed('register');
                                    },
                                    child: const Text("Register"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
