import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';

class EventCreatePage extends HookConsumerWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RelativeBuilder(builder: (context, width, height, sy, sx) {
      return GestureDetector(
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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
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
                      Text(
                        "Buat Event",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),
                  const Text("Gambar/Pamflet"),
                  const SizedBox(height: 8),
                  const Card(
                    child: InkWell(
                      child: SizedBox(
                        height: 120,
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Center(
                            child: Text("Upload Disini"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Nama Webinar"),
                  const SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    // controller: namaController,
                  ),
                  const SizedBox(height: 24),
                  const Text("Deskripsi Webinar"),
                  const SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    minLines: 4,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // controller: deskripsiController,
                  ),
                  const SizedBox(height: 24),
                  const Text("Tanggal Webinar"),
                  const SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    // controller: tanggalController,
                    readOnly: true,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030, 12, 31),
                      ).then((value) {
                        if (value != null) {
                          // tanggalController.text =
                          //     DateFormat("y-MM-dd").format(value);
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Jam Mulai"),
                            const SizedBox(height: 8),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: jamMulaiController,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    // jamMulaiController.text = value.format(context);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Jam Selesai"),
                            const SizedBox(height: 8),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: jamSelesaiController,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    // jamSelesaiController.text =
                                    //     value.format(context);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text("Kuota"),
                  const SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    // controller: kuotaController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text("Link Webinar"),
                  const SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    // controller: linkController,
                  ),
                  const SizedBox(height: 24),
                  const Text("Speaker"),
                  const SizedBox(height: 8),
                  for (int i = 1; i <= 1; i++)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Speaker $i"),
                            const SizedBox(height: 24),
                            TextField(
                              // controller: namaNarasumberController,
                              decoration:
                                  const InputDecoration(labelText: "Nama"),
                              onChanged: (val) {
                                // ref.read(speakerProvider.notifier).setNama(i, val);
                              },
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            TextField(
                              // controller: emailNarasumberController,
                              decoration:
                                  const InputDecoration(labelText: "Email"),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                // ref.read(speakerProvider.notifier).setEmail(i, val);
                              },
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            TextField(
                              // controller: noTelpNarasumberController,
                              decoration: const InputDecoration(
                                  labelText: "Nomor Telp"),
                              keyboardType: TextInputType.phone,
                              onChanged: (val) {
                                // ref
                                //     .read(speakerProvider.notifier)
                                //     .setNoTelp(i, val);
                              },
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            TextField(
                              // controller: asalNarasumberController,
                              decoration:
                                  const InputDecoration(labelText: "Asal"),
                              onChanged: (val) {
                                // ref.read(speakerProvider.notifier).setAsal(i, val);
                              },
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            Builder(
                              builder: (context) {
                                // if (i == listNarasumber.length - 1) {
                                return ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // ref
                                        //     .read(speakerProvider.notifier)
                                        //     .addSpeaker();
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                );
                                // } else {
                                //   return ButtonBar(
                                //     children: [
                                //       ElevatedButton(
                                //         onPressed: () {
                                //           // ref
                                //           //     .read(speakerProvider.notifier)
                                //           //     .removeSpeaker(i);
                                //         },
                                //         style: ElevatedButton.styleFrom(
                                //           primary: Colors.red,
                                //         ),
                                //         child: const Icon(Icons.remove),
                                //       ),
                                //     ],
                                //   );
                                // }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Buat Event"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
