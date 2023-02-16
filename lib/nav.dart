import 'package:flutter/material.dart';

import 'Homepage.dart';

import 'constants/color_constants.dart';
import 'package:flutter_application_1/notification.dart';

import 'attendance.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int index = 0;

  List<Widget> _index = [
    Homepage(),
     NotificationPage(),
     AttendancePage(),
  ];

  void updatePage(int _index) {
    setState(() {
      index = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _index[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Gcolors.primaryColor400,
        backgroundColor: Gcolors.neutralColor1000,
        unselectedItemColor: Gcolors.primaryColor050,
        //type: BottomNavigationBarType.fixed,

        currentIndex: index,
        onTap: updatePage,

        // data: NavigationBarThemeData(
        //     indicatorColor: Gcolors.primaryColor400,
        //     labelTextStyle: MaterialStateProperty.all(
        //         TextStyle(fontSize: 13, color: Gcolors.primaryColor050))),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Gcolors.primaryColor050,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Gcolors.primaryColor050),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Gcolors.primaryColor050),
              label: 'Attendance')
        ],
        // child: Container(
        //   child: NavigationBar(
        //       height: 70,
        //       backgroundColor: Gcolors.neutralColor1000,
        //       selectedIndex: index,
        //       onDestinationSelected: updatePage,

        //       // (index) => setState(() {
        //       //       this.index = index;
        //       //     }),
        //       destinations: [
        //         NavigationDestination(
        //           icon: Icon(
        //             Icons.home,
        //             color: Gcolors.primaryColor050,
        //           ),
        //           label: 'Home',
        //         ),
        //         NavigationDestination(
        //             icon: Icon(Icons.notifications,
        //                 color: Gcolors.primaryColor050),
        //             label: 'Notifications'),
        //         NavigationDestination(
        //             icon: Icon(Icons.bar_chart, color: Gcolors.primaryColor050),
        //             label: 'Attendance'),
        //       ]),
        // ),
      ),
    );
  }
}
