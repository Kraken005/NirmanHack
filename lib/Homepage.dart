import 'package:flutter/material.dart';
import 'constants/color_constants.dart';
import 'Task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  List Task = [
    ["Zairza App Design"],
    ["Zairza App Dev"],
    ["Flat Assignment"],
    ["DE Quiz"]
  ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1B1F),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffB8FC27),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Color(0xff1C1B1F),
            size: 35,
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Gcolors.primaryColor400,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 13, color: Gcolors.primaryColor050))),
          child: NavigationBar(
              height: 70,
              backgroundColor: Gcolors.neutralColor1000,
              selectedIndex: index,
              onDestinationSelected: (index) => setState(() {
                    this.index = index;
                  }),
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Gcolors.primaryColor050,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                    icon: Icon(Icons.notifications,
                        color: Gcolors.primaryColor050),
                    label: 'Notifications'),
                NavigationDestination(
                    icon: Icon(Icons.bar_chart, color: Gcolors.primaryColor050),
                    label: 'Attendance'),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 7, right: 7),
          child: Container(
              child: Column(
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
                      Container(
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
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                    hintText: 'Search for Clubs...',
                                    hintStyle: TextStyle(
                                        color: Gcolors.neutralColor400),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 13),
                      Image.asset('assets/images/Profile.png'),
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
                            'Hey! Abhinaba',
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
                                  color: Gcolors.primaryColor050, fontSize: 14),
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
                padding: const EdgeInsets.only(right: 300.0),
                child: Text(
                  "TASKS",
                  style: TextStyle(
                      fontSize: 16,
                      color: Gcolors.primaryColor050,
                      fontWeight: FontWeight.w600),
                ),
              ),

              Expanded(
                  child: ListView(
                children: [
                  Task(
                    taskName: 'Zairza App Design',
                    taskCompleted: true,
                    onChanged: (p0) {},
                  ),
                  Task(
                    taskName: 'Zairza App Design',
                    taskCompleted: false,
                    onChanged: (p0) {},
                  ),
                  Task(
                    taskName: 'Zairza App Design',
                    taskCompleted: true,
                    onChanged: (p0) {},
                  ),
                  Task(
                    taskName: 'Zairza App Design',
                    taskCompleted: false,
                    onChanged: (p0) {},
                  ),
                ],
              ))

              // Container(
              //  // height: 463,
              //   //width: 366,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Color(0xff302D38)),
              //   child: Container(

              //       padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              //       child: Column(

              //         children: [
              //           Expanded(child: ListView(
              //             children: [
              //               Task(),
              //             ],
              //           ))
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Icon(Icons.check_box,
              //         color: Gcolors.primaryColor400, size: 36),

              //     SizedBox(width: 10),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //     Text(
              //       "Zairza App Design",
              //       style: TextStyle(
              //           fontSize: 14,
              //           color: Gcolors.primaryColor050),
              //     ),
              //     SizedBox(height: 6),
              //     Text('5th Jan - 12:30 pm',
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Gcolors.primaryColor400,
              //           fontWeight: FontWeight.bold,
              //         )),
              //   ],
              // ),
              // SizedBox(width: 134),
              // Icon(Icons.edit,
              //     color: Gcolors.primaryColor200, size: 32),
              //   ],
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              // Divider(
              //   color: Gcolors.primaryColor050,
              //   thickness: 1,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Icon(Icons.check_box,
              //         color: Gcolors.primaryColor400, size: 36),
              //     SizedBox(width: 10),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Zairza App Dev",
              //           style: TextStyle(
              //               fontSize: 14,
              //               color: Gcolors.primaryColor050),
              //         ),
              //         SizedBox(height: 6),
              //         Text('7th Jan - 12:30 pm',
              //             style: TextStyle(
              //               fontSize: 14,
              //               color: Gcolors.primaryColor400,
              //               fontWeight: FontWeight.bold,
              //             )),
              //       ],
              //     ),
              //     SizedBox(width: 134),
              //     Icon(Icons.edit,
              //         color: Gcolors.primaryColor200, size: 32),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Divider(
              //   color: Gcolors.primaryColor050,
              //   thickness: 1,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              //  Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Icon(Icons.check_box,
              //         color: Gcolors.primaryColor400, size: 36),
              //     SizedBox(width: 10),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "FLAT Assignment",
              //           style: TextStyle(
              //               fontSize: 14,
              //               color: Gcolors.primaryColor050),
              //         ),
              //         SizedBox(height: 6),
              //         Text('5th Jan - 12:30 pm',
              //             style: TextStyle(
              //               fontSize: 14,
              //               color: Gcolors.primaryColor400,
              //               fontWeight: FontWeight.bold,
              //             )),
              //       ],
              //     ),
              //     SizedBox(width: 134),
              //     Icon(Icons.edit,
              //         color: Gcolors.primaryColor200, size: 32),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Divider(
              //   color: Gcolors.primaryColor050,
              //   thickness: 1,
              // ),
              // SizedBox(
              //   height: 10,
              // )
            ],
          )),
        )

//next
        );
  }
}
