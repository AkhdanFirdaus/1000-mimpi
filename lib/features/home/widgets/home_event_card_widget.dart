import 'package:flutter/material.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/event/index.dart';

class HomeEventCardWidget extends StatelessWidget {
  const HomeEventCardWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(event.tanggal),
                ),
                ListTile(
                  title: Text(
                    event.nama,
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: Text("Kapasitas ${event.kuota}"),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(event.penyelenggara.name),
            trailing: IconButton(
              onPressed: () {
                getIt<AppRouter>().pushNamed('event/${event.id}');
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
