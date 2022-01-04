import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/injection_container.dart';
import '../../../core/themes/app_color.dart';
import '../../auth/index.dart';
import '../index.dart';

class EventDetailPage extends HookConsumerWidget {
  const EventDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final isLogged = user.maybeMap(
      user: (_) => true,
      orElse: () => false,
    );

    final userData = user.maybeMap(
      user: (user) => user,
      orElse: () => null,
    );

    final event = ref.watch(eventDetailFutureProvider(id));
    return RelativeBuilder(builder: (context, width, height, sy, sx) {
      AutoRouter.of(context);
      return Scaffold(
        body: SafeArea(
          child: event.when(
            data: (data) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        Row(
                          children: [
                            BackButton(
                              onPressed: () {
                                getIt<AppRouter>().pop();
                              },
                            ),
                            Expanded(
                              child: Text(
                                data.nama,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: sy(280),
                          child: Stack(
                            children: [
                              Container(
                                height: sy(180),
                                decoration: const BoxDecoration(
                                  color: AppColor.pink,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: sx(360),
                                  height: sy(200),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: const Text("Free"),
                                            subtitle: Text(
                                              "Biaya",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                            trailing: const Icon(
                                                Icons.calendar_today),
                                          ),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.access_time),
                                            title: const Text("Jam"),
                                            subtitle: Text(data.jamMulai),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.timer),
                                            title: Text("Durasi"),
                                            subtitle: Text("2 jam"),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.location_on),
                                            title: Text("Lokasi"),
                                            subtitle: Text("Online Meeting"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text("Description"),
                        const SizedBox(height: 8),
                        Text(
                          data.deskripsi,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 24),
                        const Text("Pembicara"),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: data.narasumber!.map((speaker) {
                                return ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    radius: 8,
                                  ),
                                  title: Text(speaker.name),
                                  subtitle: Text(speaker.asal),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text("Creator"),
                        const SizedBox(height: 8),
                        ListTile(
                          tileColor: Colors.grey.shade200,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          title: Text(data.penyelenggara.name),
                          subtitle: Text(data.penyelenggara.email),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                        if (isLogged) ...[
                          const SizedBox(height: 24),
                          const Text("Link Meet"),
                          const SizedBox(height: 8),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.link),
                            title: SelectableText(data.link),
                          ),
                        ]
                      ],
                    ),
                  ),
                  if (isLogged)
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: (() {
                          if (data.pendaftar!
                                  .indexWhere((e) => e.id == userData?.id) !=
                              -1) {
                            return ElevatedButton(
                              onPressed: () {
                                MotionToast.info(
                                  title: "Sudah Terdaftar",
                                  description: "Anda sudah terdaftar",
                                ).show(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("Sudah Daftar"),
                              ),
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(eventProvider)
                                    .registerEvent(id, userData!.id)
                                    .then((value) {
                                  MotionToast.success(
                                    title: "Daftar",
                                    description: value,
                                  ).show(context);
                                  ref.refresh(eventDetailFutureProvider(id));
                                }).catchError((e) {
                                  MotionToast.error(
                                    title: "Daftar",
                                    description: e.toString(),
                                  ).show(context);
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("Join Now"),
                              ),
                            );
                          }
                        })(),
                      ),
                    ),
                ],
              );
            },
            error: (error, s) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
    });
  }
}
