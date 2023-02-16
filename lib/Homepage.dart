import 'dart:math';
import 'package:flutter_application_1/attendance.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/experimentation/setTaskExperiment.dart';
import 'package:flutter_application_1/model/TaskComponents.dart';
import 'package:flutter_application_1/notification.dart';
import 'package:flutter_application_1/search.dart';
import 'package:intl/intl.dart';

import './settask.dart';
import 'package:flutter/material.dart';
import 'constants/color_constants.dart';
import 'Tasks.dart';
import './profile.dart';

class Homepage extends StatefulWidget {
  //final List<TaskComponent>? events;
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  // List TaskList = [
  //   ["Zairza App Design", false],
  //   ["Zairza App Dev", false],
  //   ["Flat Assignment", false],
  //   ["DE Quiz", false]
  // ];
  //List<TaskComponent> events = [TaskComponent(title: 'Zairza App Work', description: 'Design and implement app for zairza club', input: input, id: DateTime.now().toString())];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      //events[index][1] = !TaskList[index][1];
    });
  }

  final List<TaskComponent> events = [
    TaskComponent(
        title: 'Zairza App Work',
        description: 'Design and deploy Zairza App',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        id: DateTime.now().toString()),
    TaskComponent(
        title: 'Flat Assignment',
        description: 'Score full marks in Flat assignment',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        id: DateTime.now().toString()),
    TaskComponent(
        title: 'Coffee Date with Barsha',
        description: 'At Radium Cafe',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        id: DateTime.now().toString()),
    TaskComponent(
        title: 'Switch to "Switch"',
        description: 'Ditch Zairza',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        id: DateTime.now().toString()),
  ];

  void _addEvents(String title, String description, DateTime date,
      TimeOfDay time, String id) {
    final newEvent = TaskComponent(
        title: title, description: description, date: date, time: time, id: id);

    setState(() {
      events.add(newEvent);
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content: new Text(
              'Do you want to exit an App',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Gcolors.neutralColor900,
            actions: <Widget>[
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 3, color: Gcolors.primaryColor400),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No', style: TextStyle(color: Colors.white)),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffB8FC27),
                  side: BorderSide(width: 3, color: Gcolors.primaryColor400),
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        )) ??
        false;
  }

  // int _currentIndex = 0;
  // List _screens = [Homepage(), NotificationPage(), Attendance()];

  // void _updateIndex(int value) {
  //   setState(() {
  //     _currentIndex = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Color(0xff1C1B1F),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffB8FC27),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SettaskExperiment(addEvents: _addEvents)));
            },
            child: Icon(
              Icons.add,
              color: Color(0xff1C1B1F),
              size: 35,
            ),
          ),
          // bottomNavigationBar: NavigationBarTheme(
          //   data: NavigationBarThemeData(
          //       indicatorColor: Gcolors.primaryColor400,
          //       labelTextStyle: MaterialStateProperty.all(
          //           TextStyle(fontSize: 13, color: Gcolors.primaryColor050))),
          //   child: NavigationBar(
          //       height: 70,
          //       backgroundColor: Gcolors.neutralColor1000,
          //       selectedIndex: index,
          //       onDestinationSelected: (index) => setState(() {
          //             this.index = index;
          //           }),
          //       destinations: [
          //         NavigationDestination(
          //           icon: IconButton(
          //             icon: Icon(Icons.home),
          //             onPressed: () {
          //               Navigator.of(context).pushNamed(homeRoute);
          //             },
          //             color: Gcolors.primaryColor050,
          //           ),
          //           label: 'Home',
          //         ),
          //         NavigationDestination(
          //             icon: IconButton(
          //                 onPressed: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) =>
          //                               const NotificationPage()));
          //                 },
          //                 icon: Icon(Icons.notifications),
          //                 color: Gcolors.primaryColor050),
          //             label: 'Notifications'),
          //         NavigationDestination(
          //             icon: IconButton(
          //                 onPressed: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => const Attendance()));
          //                 },
          //                 icon: Icon(Icons.bar_chart),
          //                 color: Gcolors.primaryColor050),
          //             label: 'Attendance'),
          //       ]),

          // ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 7, right: 7, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 7),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 45.38,
                          width: 40,
                        ),
                        SizedBox(
                          width: 21,
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            width: 244,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white)),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Gcolors.neutralColor400,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Container(
                                    height: 100,
                                    width: 170,
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage())),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Gcolors.neutralColor1000),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 13),
                        //Image.asset('assets/images/Profile.png'),
                        InkWell(
                          child: Image.asset('assets/images/Profile.png'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => profileinfo()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff302D38)),
                  height: 72,
                  width: 366,
                  child: Row(
                    children: [
                      Image.asset('assets/images/design.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image.asset('assets/images/design.png'),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                            ),
                            child: Text(
                              'Hey! Sakshi',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Gcolors.primaryColor100,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Your Attendance is ',
                                style: TextStyle(
                                    color: Gcolors.primaryColor050,
                                    fontSize: 14),
                              ),
                              Text(
                                '85%',
                                style: TextStyle(
                                    color: Color(0xffB8FC27),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 66.76),
                                child: Text(
                                  'Update->',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffB8FC27),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    "TASKS",
                    style: TextStyle(
                        fontSize: 16,
                        color: Gcolors.primaryColor050,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //ToDoTask(events: events),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Gcolors.neutralColor900,
                        borderRadius: BorderRadius.circular(20)),
                    child: ToDoTask(events: events),
                    // child: ListView.builder(
                    //   itemCount: events.length,
                    //   itemBuilder: (context, index) {
                    //     // Container(
                    //     //     padding: EdgeInsets.only(
                    //     //         left: 10, right: 15, bottom: 10),
                    //     //     decoration: BoxDecoration(
                    //     //         color: Gcolors.neutralColor900,
                    //     //         borderRadius: BorderRadius.circular(20)),
                    //     //     child: ListTile(
                    //     //       leading: Container(child: Text('Checkbox'),), title: Text(events[index].title), subtitle: Text(DateFormat.yMMMEd().format(events[index].date)), trailing: Icon(Icons.edit_document, color: Gcolors.primaryColor400),
                    //     //     ));
                    //     return ToDoTask(
                    //       events: [
                    //         TaskComponent(
                    //             title: events[index].title,
                    //             description: events[index].description,
                    //             date: events[index].date,
                    //             time: events[index].time,
                    //             id: events[index].id)
                    //       ],
                    //       // taskName: events[index].title,
                    //       // taskCompleted: events[index].onChanged,
                    //       // onChanged: (value) =>
                    //       //     checkBoxChanged(value, index));
                    //     );
                    //   },
                    // ),
                  ),
                ))
              ],
            ),
          )

          //next
          ),
    );
  }
}
