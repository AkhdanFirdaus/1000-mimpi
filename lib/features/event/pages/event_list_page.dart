import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/event/widgets/event_card_widget.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({Key? key, @QueryParam('title') this.title = "Event"})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
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
              child: Column(
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
                        Text(title)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(24),
                      itemCount: 4,
                      separatorBuilder: (_, __) => const SizedBox(height: 24),
                      itemBuilder: (context, index) {
                        if (title.contains('Kelola')) {
                          return EventManageCardWidget(id: index);
                        }

                        if (title.contains('Diikuti')) {
                          return EventCardJoinedWidget(id: index);
                        }

                        return EventCardWidget(id: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
