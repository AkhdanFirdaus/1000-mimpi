import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:seribu_mimpi/features/creator/controllers/creator_controller.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CreatorPage extends HookConsumerWidget {
  const CreatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creators = ref.watch(creatorFutureProvider);
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
              child: creators.when(
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
                              "Creator",
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
                            label: Text("Cari Creator"),
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
                              child: InkWell(
                                onTap: () {
                                  getIt<AppRouter>()
                                      .pushNamed('creator/${item.id}');
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: AppColor.pink,
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(item.name),
                                        subtitle: Text(item.email),
                                      ),
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
