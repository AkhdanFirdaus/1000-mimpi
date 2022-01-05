import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/injection_container.dart';
import '../../auth/index.dart';
import '../../creator/index.dart';
import '../index.dart';

class EventListPage extends HookConsumerWidget {
  const EventListPage({Key? key, @QueryParam('title') this.title = "Event"})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider).maybeMap(
          user: (user) => user.id,
          orElse: () => -1,
        );
    late AsyncValue<List<Event>> data;
    if (title.contains('Diikuti')) {
      data = ref.watch(joinedevEntFutureProvider(userId));
    } else {
      data = ref.watch(creatorEventsFutureProvider(userId));
    }

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
              child: data.when(
                data: (data) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                        child: Row(
                          children: [
                            BackButton(
                              onPressed: () {
                                getIt<AppRouter>().pop();
                              },
                            ),
                            Text(title),
                          ],
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            if (title.contains('Diikuti')) {
                              ref.refresh(joinedevEntFutureProvider(userId));
                            } else {
                              ref.refresh(creatorEventsFutureProvider(userId));
                            }
                            return Future.value();
                          },
                          child: ListView.separated(
                            padding: const EdgeInsets.all(24),
                            itemCount: data.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 24),
                            itemBuilder: (context, index) {
                              if (title.contains('Kelola')) {
                                return EventManageCardWidget(
                                    event: data[index]);
                              }

                              if (title.contains('Diikuti')) {
                                return EventCardJoinedWidget(
                                    event: data[index]);
                              }

                              return EventCardWidget(event: data[index]);
                            },
                          ),
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
