import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/injection_container.dart';
import '../../auth/index.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogged = ref.watch(userProvider).maybeMap(
          user: (_) => true,
          orElse: () => false,
        );

    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: isLogged
              ? FloatingActionButton.extended(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed('event/create');
                  },
                  label: const Text("Buat Event"),
                  icon: const Icon(Icons.add),
                )
              : null,
          body: SafeArea(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: sy(100),
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 40,
                      ),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Text(
                        "1000 Mimpi",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    SizedBox(
                      height: sy(120),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            getIt<AppRouter>().pushNamed('event');
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: sx(30)),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Cari Event!"),
                                Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(sx(24)),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                child: Text("24"),
                              ),
                              const SizedBox(height: 10),
                              Text("Webinar",
                                  style: Theme.of(context).textTheme.caption),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                child: Text("30"),
                              ),
                              const SizedBox(height: 10),
                              Text("Pembicara",
                                  style: Theme.of(context).textTheme.caption),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {
                            getIt<AppRouter>()
                                .pushNamed('event/list?title=Disimpan');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  child: Icon(Icons.bookmark),
                                ),
                                const SizedBox(height: 10),
                                Text("Disimpan",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isLogged) ...[
                        Card(
                          child: InkWell(
                            onTap: () {
                              getIt<AppRouter>()
                                  .pushNamed('event/list?title=Diikuti');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CircleAvatar(
                                    radius: 24,
                                    child: Icon(Icons.check),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Diikuti",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {
                              getIt<AppRouter>()
                                  .pushNamed('event/list?title=Kelola');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CircleAvatar(
                                    radius: 24,
                                    child: Icon(Icons.manage_accounts),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Kelola Event",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
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
