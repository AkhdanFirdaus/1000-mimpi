import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/themes/app_color.dart';
import '../../auth/index.dart';
import '../../creator/controllers/creator_controller.dart';
import '../../event/widgets/event_card_widget.dart';

class SelectedWidget extends HookConsumerWidget {
  const SelectedWidget({
    Key? key,
    this.type = 0,
  }) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider).maybeMap(
          user: (user) => user.id,
          orElse: () => -1,
        );
    final data = ref.watch(creatorEventsFutureProvider(userId));
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return data.when(
          data: (data) {
            return data.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(36),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (type != 0) {
                        return EventCardJoinedWidget(event: data[index]);
                      }
                      return EventCardWidget(event: data[index]);
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 24),
                    itemCount: data.length,
                    shrinkWrap: true,
                  )
                : const NotSelectedWidget(text: 'tidak ada item');
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
        );
      },
    );
  }
}

class NotSelectedWidget extends StatelessWidget {
  const NotSelectedWidget({Key? key, this.text = 'Tidak ada tanggal terpilih'})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Container(
          height: sy(80),
          margin: const EdgeInsets.all(36),
          decoration: const BoxDecoration(
            color: AppColor.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: Text(text),
          ),
        );
      },
    );
  }
}
