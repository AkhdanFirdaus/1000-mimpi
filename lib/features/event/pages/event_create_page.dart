import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/auth/index.dart';
import 'package:seribu_mimpi/features/event/controllers/event_controller.dart';
import 'package:seribu_mimpi/features/speaker/index.dart';

class EventCreatePage extends HookConsumerWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaController = useTextEditingController();
    final deskripsiController = useTextEditingController();
    final kuotaController = useTextEditingController();
    final linkController = useTextEditingController();
    final tanggalController = useTextEditingController();
    final jamMulaiController = useTextEditingController();
    final jamSelesaiController = useTextEditingController();

    final speakers = ref.watch(speakerProvider);
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
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
                child: Form(
                  key: formKey.value,
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
                        controller: namaController,
                      ),
                      const SizedBox(height: 24),
                      const Text("Deskripsi Webinar"),
                      const SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        minLines: 4,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: deskripsiController,
                      ),
                      const SizedBox(height: 24),
                      const Text("Tanggal Webinar"),
                      const SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: tanggalController,
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
                              tanggalController.text =
                                  DateFormat("y-MM-dd").format(value);
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
                                  controller: jamMulaiController,
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        jamMulaiController.text =
                                            value.format(context);
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
                                  controller: jamSelesaiController,
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        jamSelesaiController.text =
                                            value.format(context);
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
                        controller: kuotaController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      const Text("Link Webinar"),
                      const SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: linkController,
                      ),
                      const SizedBox(height: 24),
                      const Text("Speaker"),
                      const SizedBox(height: 8),
                      for (final e in speakers)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Speaker ${e.id}"),
                                const SizedBox(height: 24),
                                TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                      const InputDecoration(labelText: "Nama"),
                                  onChanged: (val) {
                                    ref
                                        .read(speakerProvider.notifier)
                                        .setNama(e.id, val);
                                  },
                                ),
                                const SizedBox(height: 12),
                                const Divider(),
                                const SizedBox(height: 12),
                                TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                      const InputDecoration(labelText: "Email"),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {
                                    ref
                                        .read(speakerProvider.notifier)
                                        .setEmail(e.id, val);
                                  },
                                ),
                                const SizedBox(height: 12),
                                const Divider(),
                                const SizedBox(height: 12),
                                TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      labelText: "Nomor Telp"),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (val) {
                                    ref
                                        .read(speakerProvider.notifier)
                                        .setNoTelp(e.id, val);
                                  },
                                ),
                                const SizedBox(height: 12),
                                const Divider(),
                                const SizedBox(height: 12),
                                TextField(
                                  decoration:
                                      const InputDecoration(labelText: "Asal"),
                                  onChanged: (val) {
                                    ref
                                        .read(speakerProvider.notifier)
                                        .setAsal(e.id, val);
                                  },
                                ),
                                const SizedBox(height: 12),
                                const Divider(),
                                const SizedBox(height: 12),
                                Builder(
                                  builder: (context) {
                                    if (e.id == speakers.last.id) {
                                      return ButtonBar(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      speakerProvider.notifier)
                                                  .addSpeaker();
                                            },
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return ButtonBar(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      speakerProvider.notifier)
                                                  .removeSpeaker(e);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                            child: const Icon(Icons.remove),
                                          ),
                                        ],
                                      );
                                    }
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
                          onPressed: () {
                            final user = ref.read(userProvider);
                            final userId = user.maybeMap(
                              user: (user) => user.id,
                              orElse: () => -1,
                            );

                            final speaks = ref.read(speakerProvider);
                            ref
                                .read(eventProvider)
                                .createEvent(
                                  namaController.text,
                                  deskripsiController.text,
                                  int.parse(kuotaController.text),
                                  tanggalController.text,
                                  jamMulaiController.text,
                                  userId,
                                  linkController.text,
                                  jamSelesaiController.text,
                                  speaks,
                                )
                                .then((value) {
                              MotionToast.success(
                                title: "Sukses",
                                description: value,
                                toastDuration: const Duration(seconds: 3),
                              ).show(context);
                              formKey.value.currentState!.reset();
                            }).catchError((error) {
                              MotionToast.error(
                                title: "Error",
                                description: "Gagal membuat webinar",
                                toastDuration: const Duration(seconds: 2),
                              ).show(context);
                            });
                          },
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
          ),
        );
      },
    );
  }
}
