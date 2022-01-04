import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/features/creator/controllers/creator_controller.dart';
import 'package:seribu_mimpi/features/event/index.dart';
import '../../../core/injection_container.dart';

class CreatorDetailPage extends HookConsumerWidget {
  const CreatorDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creator = ref.watch(creatorDetailFutureProvider(id));
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
              child: creator.when(
                data: (data) {
                  return ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      ListTile(
                        leading: BackButton(
                          onPressed: () {
                            getIt<AppRouter>().pop();
                          },
                        ),
                        title: Text(data.name),
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Email"),
                                  Text(data.email)
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("No Telpon"),
                                  Text(data.notelp),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Asal"),
                                  Text(data.asal),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ListTile(
                        title: const Text("Event"),
                        onTap: () {},
                      ),
                      CreatorDetailEventsWidget(userId: data.id),
                      const SizedBox(height: 24),
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

class CreatorDetailEventsWidget extends HookConsumerWidget {
  const CreatorDetailEventsWidget({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(creatorEventsFutureProvider(userId));
    return SizedBox(
      child: events.when(
        data: (data) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return EventCardWidget(event: data[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemCount: data.length,
            shrinkWrap: true,
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
    );
  }
}
