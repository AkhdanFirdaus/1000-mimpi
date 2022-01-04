import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:seribu_mimpi/features/event/widgets/event_card_widget.dart';

class SelectedWidget extends HookConsumerWidget {
  const SelectedWidget({
    Key? key,
    this.type = 0,
  }) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = useState<int>(2);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return length.value > 0
            ? ListView.separated(
                padding: const EdgeInsets.all(36),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (type != 0) {
                    return EventCardJoinedWidget(id: index);
                  }
                  return EventCardWidget(id: index);
                },
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemCount: 4,
                shrinkWrap: true,
              )
            : const NotSelectedWidget(text: 'tidak ada item');
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
