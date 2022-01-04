import 'package:flutter/material.dart';

import '../../../core/injection_container.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/1.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: AutoTabsScaffold(
        backgroundColor: Colors.transparent,
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
      ),
    );
  }
}
