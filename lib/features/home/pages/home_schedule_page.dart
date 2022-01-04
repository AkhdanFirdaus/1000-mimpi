import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/injection_container.dart';

class HomeSchedulePage extends StatelessWidget {
  const HomeSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Jadwal"),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text("Terdaftar"),
                  ),
                  Tab(
                    child: Text("Semua Jadwal"),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        child: TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay: DateTime.utc(2010, 03, 27),
                          lastDay: DateTime.utc(2030, 12, 03),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(36),
                          decoration: const BoxDecoration(
                            color: AppColor.pink,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: const Center(
                            child: Text("Tidak ada tanggal terpilih"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        child: TableCalendar(
                          focusedDay: DateTime.now(),
                          firstDay: DateTime.utc(2010, 03, 27),
                          lastDay: DateTime.utc(2030, 12, 03),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(36),
                          decoration: const BoxDecoration(
                            color: AppColor.pink,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: const Center(
                            child: Text("Tidak ada tanggal terpilih"),
                          ),
                        ),
                      ),
                    ],
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
