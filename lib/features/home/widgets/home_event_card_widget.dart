import 'package:flutter/material.dart';
import 'package:seribu_mimpi/core/injection_container.dart';

class HomeEventCardWidget extends StatelessWidget {
  const HomeEventCardWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

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
                const ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text("27/03/01"),
                ),
                ListTile(
                  title: Text(
                    "Nama Webinar",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: const Text("Kapasitas 10/20"),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("Penyelenggara"),
            trailing: IconButton(
              onPressed: () {
                getIt<AppRouter>().pushNamed('event/$id');
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
