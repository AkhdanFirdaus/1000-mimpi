import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/auth/index.dart';
import 'package:seribu_mimpi/features/creator/controllers/creator_controller.dart';
import 'package:seribu_mimpi/features/event/widgets/event_card_widget.dart';

class EventManagePage extends HookConsumerWidget {
  const EventManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider).maybeMap(
          user: (user) => user.id,
          orElse: () => -1,
        );
    final data = ref.watch(creatorEventsFutureProvider(userId));
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          body: SafeArea(
            child: data.when(
              data: (data) {
                return Column(
                  children: [
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            getIt<AppRouter>().pop();
                          },
                        ),
                        const Text("Event Yang Dibuat")
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (_, __) => const SizedBox(height: 24),
                        itemBuilder: (context, index) {
                          return EventCardWidget(event: data[index]);
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
        );
      },
    );
  }
}
