import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/event/controllers/event_controller.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class EventPage extends HookConsumerWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventFutureProvider);
    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/1.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: events.when(
                data: (data) {
                  return Column(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
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
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () {
                                  getIt<AppRouter>()
                                      .pushNamed("event/${item.id}");
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ListTile(
                                      title: Text(item.nama),
                                    ),
                                    ListTile(
                                      title: const Text("Tanggal"),
                                      subtitle: Text(item.tanggal),
                                    ),
                                    ListTile(
                                      title: const Text("Jam Mulai"),
                                      subtitle: Text(item.jamMulai),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.count(
                                1, index.isEven ? 1.3 : 1.8);
                          },
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
          ),
        );
      },
    );
  }
}
