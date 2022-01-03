import 'package:flutter/material.dart';

import '../../../core/injection_container.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HomeEventRoute(),
        HomeScheduleRoute(),
        HomeProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          iconSize: 36,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade200,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
