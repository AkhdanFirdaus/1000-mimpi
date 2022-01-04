import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/event/widgets/event_card_widget.dart';

class EventManagePage extends StatelessWidget {
  const EventManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          body: SafeArea(
            child: Column(
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
                      return EventCardWidget(id: index);
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
