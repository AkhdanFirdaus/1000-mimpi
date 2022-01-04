import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Row(
                    children: [
                      BackButton(
                        onPressed: () {
                          getIt<AppRouter>().pop();
                        },
                      ),
                      Text(
                        "Event",
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text("Cari Event"),
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          color: AppColor.pink,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: InkWell(
                          onTap: () {
                            getIt<AppRouter>().pushNamed("event/$index");
                          },
                          child: ListView(
                            children: [
                              const ListTile(
                                title: Text("Nama Event"),
                              ),
                              ListTile(
                                title: const Text("Free"),
                                subtitle: Text(
                                  "Biaya",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                trailing: const Icon(Icons.calendar_today),
                              ),
                              const ListTile(
                                title: Text("Tanggal"),
                                subtitle: Text("2021/07/03"),
                              ),
                              const ListTile(
                                title: Text("Durasi"),
                                subtitle: Text("2 jam"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                    },
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
