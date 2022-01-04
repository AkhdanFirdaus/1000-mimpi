import 'package:flutter/material.dart';

import '../../../core/injection_container.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().pushNamed('event/$id');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: const Text("Nama Event"),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Tanggal"),
                subtitle: Text("27/03/01"),
              ),
              const ListTile(
                leading: Icon(Icons.access_time),
                title: Text("Jam"),
                subtitle: Text("07.00"),
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
  const EventCardJoinedWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().pushNamed('event/$id');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: const Text("Nama Event"),
                trailing: const Icon(Icons.settings),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Tanggal"),
                subtitle: Text("27/03/01"),
              ),
              const ListTile(
                leading: Icon(Icons.access_time),
                title: Text("Jam"),
                subtitle: Text("07.00"),
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
  const EventManageCardWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().pushNamed('event/$id');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: const Text("Nama Event"),
                trailing: const Icon(Icons.settings),
              ),
              ListTile(
                title: const Text("Free"),
                subtitle: Text(
                  "Biaya",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Tanggal"),
                subtitle: Text("27/03/01"),
              ),
              const ListTile(
                leading: Icon(Icons.access_time),
                title: Text("Jam"),
                subtitle: Text("07.00"),
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
              const ListTile(
                leading: Icon(Icons.people),
                title: Text("Participant"),
                subtitle: Text("2/20"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
