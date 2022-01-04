import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/injection_container.dart';
import '../../auth/index.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/schedule_card_widget.dart';

class HomeSchedulePage extends HookConsumerWidget {
  const HomeSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogged = ref.watch(userProvider).maybeMap(
          user: (_) => true,
          orElse: () => false,
        );

    final selectedDay = ref.watch(selectedDayProvider);
    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        if (isLogged) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: sy(40),
                      child: const TabBar(
                        labelColor: Colors.pink,
                        tabs: [
                          Tab(
                            text: "Terdaftar",
                          ),
                          Tab(
                            text: "Semua Jadwal",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListView(
                            children: [
                              CalendarWidget(
                                firstDay: DateTime.utc(2010, 03, 27),
                                lastDay: DateTime.utc(2030, 12, 03),
                              ),
                              AnimatedContainer(
                                duration: const Duration(seconds: 2),
                                child: selectedDay != null
                                    ? const SelectedWidget()
                                    : const NotSelectedWidget(),
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              CalendarWidget(
                                firstDay: DateTime.utc(2010, 03, 27),
                                lastDay: DateTime.utc(2030, 12, 03),
                              ),
                              AnimatedContainer(
                                duration: const Duration(seconds: 2),
                                child: selectedDay != null
                                    ? const SelectedWidget()
                                    : const NotSelectedWidget(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  CalendarWidget(
                    firstDay: DateTime.utc(2010, 03, 27),
                    lastDay: DateTime.utc(2030, 12, 03),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    child: selectedDay != null
                        ? const SelectedWidget()
                        : const NotSelectedWidget(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class CalendarWidget extends HookConsumerWidget {
  const CalendarWidget({
    Key? key,
    required this.firstDay,
    required this.lastDay,
  }) : super(key: key);

  final DateTime firstDay;
  final DateTime lastDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final focusedDay = useState<DateTime?>(null);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Container(
          height: sy(260),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: firstDay,
            lastDay: lastDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectDay, focusDay) {
              ref.read(selectedDayProvider.notifier).state = selectDay;
              focusedDay.value = focusDay;
            },
          ),
        );
      },
    );
  }
}
