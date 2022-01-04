import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import '../../../core/injection_container.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, width, height, sy, sx) {
      AutoRouter.of(context);
      return Scaffold(
        body: SafeArea(
          child: Column(
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
                            "Title $id",
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
                                        trailing:
                                            const Icon(Icons.calendar_today),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text("Description"),
                    const SizedBox(height: 8),
                    const Text(
                      "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                    const Text("Pembicara"),
                    const SizedBox(height: 8),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 8,
                              ),
                              title: Text("MNC Group"),
                              subtitle: Text("CEO PTPT"),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 8,
                              ),
                              title: Text("MNC Group"),
                              subtitle: Text("CEO PT.MEncari Cinta Sejati"),
                            ),
                          ],
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
                      title: const Text("MNC Group"),
                      subtitle: const Text("email@email.com"),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Join Now"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
