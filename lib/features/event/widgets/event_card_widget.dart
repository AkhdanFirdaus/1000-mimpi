import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seribu_mimpi/features/event/controllers/event_controller.dart';
import 'package:seribu_mimpi/features/event/models/event.dart';

import '../../../core/injection_container.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().pushNamed('event/${event.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(event.nama),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Tanggal"),
                subtitle: Text(event.tanggal),
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text("Jam"),
                subtitle: Text(event.jamMulai),
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
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {},
                  child: const Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCardJoinedWidget extends StatelessWidget {
  const EventCardJoinedWidget({Key? key, required this.event})
      : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().pushNamed('event/${event.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(event.nama),
                trailing: const Icon(Icons.settings),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Tanggal"),
                subtitle: Text(event.tanggal),
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text("Jam"),
                subtitle: Text(event.jamMulai),
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
    );
  }
}

class EventManageCardWidget extends StatelessWidget {
  const EventManageCardWidget({Key? key, required this.event})
      : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(event.nama),
                trailing: const Icon(Icons.settings),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Tanggal"),
                subtitle: Text(event.tanggal),
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text("Jam"),
                subtitle: Text(event.jamMulai),
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
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PendaftarDialog(id: event.id);
                        },
                      );
                    },
                    child: const Text("Lihat Pendaftar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getIt<AppRouter>().pushNamed('event/${event.id}');
                    },
                    child: const Text("Detail"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PendaftarDialog extends HookConsumerWidget {
  const PendaftarDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(eventDetailFutureProvider(id));
    return SimpleDialog(
      children: data.when(
        data: (data) {
          if (data.pendaftar?.isNotEmpty ?? false) {
            return [
              const SimpleDialogOption(
                child: Text("Data Pendaftar"),
              ),
              for (final e in data.pendaftar!)
                SimpleDialogOption(
                  child: ListTile(
                    title: Text(e.name),
                    subtitle: Text(e.email),
                    trailing: Text(e.notelp),
                  ),
                ),
            ];
          }
          return const [
            SimpleDialogOption(
              child: Text("Tidak ada data"),
            ),
          ];
        },
        error: (error, s) {
          return const [
            SimpleDialogOption(
              child: Text("Tidak ada data"),
            ),
          ];
        },
        loading: () {
          return const [
            SimpleDialogOption(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ];
        },
      ),
    );
  }
}
