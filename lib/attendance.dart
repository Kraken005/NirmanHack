import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/color_constants.dart';
import 'package:flutter_application_1/square.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List AttendanceList = [
    ["FLAT CLASS"],
    ["DSC CLASS"],
    ["DMS CLASS"],
    ["BE CLASS"],
    //["COA CLASS"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Gcolors.neutralColor1000,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffB8FC27),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Gcolors.neutralColor900,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Add Subject",
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(color: Gcolors.primaryColor050)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          height: 100,
                          width: 170,
                          child: TextField(
                            style: TextStyle(
                                fontSize: 14, color: Gcolors.neutralColor400),
                            decoration: InputDecoration(
                              hintText: 'Search for Clubs...',
                              hintStyle:
                                  TextStyle(color: Gcolors.neutralColor400),
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Gcolors.primaryColor400),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Gcolors.neutralColor900)),
                          ))
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  actionsOverflowButtonSpacing: 20,
                  actions: [],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Color(0xff1C1B1F),
          size: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Gcolors.neutralColor900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Goal: ',
                              style: TextStyle(
                                  fontSize: 16, color: Gcolors.neutralColor400),
                            ),
                            Text(
                              '75%',
                              style: TextStyle(
                                  color: Gcolors.primaryColor400,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Overall Attendance: ',
                              style: TextStyle(
                                  color: Gcolors.neutralColor400, fontSize: 16),
                            ),
                            Text(
                              '0%',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Gcolors.primaryColor400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 8),
                child: Text(
                  'ATTENDANCE LIST :-',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Gcolors.primaryColor050),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  // height: 450,
                  // width: 400,
                  decoration: BoxDecoration(
                      color: Gcolors.neutralColor900,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.builder(
                      itemCount: AttendanceList.length,
                      itemBuilder: (context, index) {
                        return MySquare(
                          Name: AttendanceList[index][0],
                          //Name: Attendance_list[index],
                        );
                      }),
                ),
              ),
              // Divider(
              //   thickness: 1,
              //   color: Gcolors.primaryColor050,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constants/color_constants.dart';
// import 'package:test_api/backend.dart';
// import 'package:table_calendar/table_calendar.dart';


// class Attendance extends StatefulWidget {
//   const Attendance({super.key});

//   @override
//   State<Attendance> createState() => _AttendanceState();
// }

// class _AttendanceState extends State<Attendance> {
//   DateTime Today = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Gcolors.neutralColor1000,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Gcolors.neutralColor900,
//                     borderRadius: BorderRadius.circular(20)),
//                 height: 600,
//                 width: 350,
//                 // color: Gcolors.neutralColor900,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 16.0, top: 20),
//                           child: Text(
//                             'Woohoo..! Your current attendance is ',
//                             style: TextStyle(
//                                 fontSize: 14, color: Gcolors.primaryColor050),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0),
//                           child: Text(
//                             '85%.',
//                             style: TextStyle(
//                                 color: Gcolors.primaryColor400,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 1,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 16.0),
//                           child: Text(
//                             'You can take more ',
//                             style: TextStyle(color: Gcolors.primaryColor050),
//                           ),
//                         ),
//                         Text(
//                           '18 classes',
//                           style: TextStyle(
//                               color: Gcolors.primaryColor400,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14),
//                         ),
//                         Text(
//                           ' leave in this month',
//                           style: TextStyle(
//                               fontSize: 14, color: Gcolors.primaryColor050),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 64.0),
//                       child: Text(
//                         'to maintain your attendance above 75%',
//                         style: TextStyle(
//                             fontSize: 14, color: Gcolors.primaryColor050),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 16.0, right: 16, top: 10, bottom: 12),
//                       child: Divider(
//                         thickness: 1,
//                         color: Gcolors.primaryColor050,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 260.0),
//                       child: Text(
//                         'Date',
//                         style: TextStyle(
//                             fontSize: 20, color: Gcolors.primaryColor100),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                   width: 1, color: Gcolors.primaryColor200)),
//                           //color: Gcolors.primaryColor050,
//                           child: TableCalendar(
//                             rowHeight: 45,
//                             headerStyle: HeaderStyle(
//                                 titleTextStyle:
//                                     TextStyle(color: Gcolors.primaryColor400),
//                                 formatButtonVisible: false,
//                                 titleCentered: true),
//                             availableGestures: AvailableGestures.all,
//                             selectedDayPredicate: (day) =>
//                                 isSameDay(day, Today),
//                             firstDay: DateTime.utc(2010, 10, 16),
//                             lastDay: DateTime.utc(2030, 3, 14),
//                             focusedDay: Today,
//                             onDaySelected: _OnDaySelected,
//                             calendarStyle: CalendarStyle(
//                                 selectedTextStyle: TextStyle(
//                                     color: Gcolors.neutralColor1000,
//                                     fontWeight: FontWeight.bold),
//                                 selectedDecoration: BoxDecoration(
//                                     color: Gcolors.primaryColor400,
//                                     shape: BoxShape.circle),
//                                 defaultTextStyle:
//                                     TextStyle(color: Gcolors.primaryColor050),
//                                 weekendTextStyle:
//                                     TextStyle(color: Gcolors.primaryColor050),
//                                 todayTextStyle: TextStyle(
//                                     color: Gcolors.neutralColor1000,
//                                     fontWeight: FontWeight.bold),
//                                 todayDecoration: BoxDecoration(
//                                     color: Gcolors.primaryColor400,
//                                     shape: BoxShape.circle)),
//                           )),
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 260.0),
//                         child: Text(
//                           'Period',
//                           style: TextStyle(
//                               color: Gcolors.primaryColor200, fontSize: 16),
//                         ),
//                       ),
//                     ),
                    
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
                          
//                             child: ListView(
//                               children: [
//                                 Container(
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),color: Gcolors.primaryColor400
//                                   ),

//                                 )
                        
                                
//                               ],
//                             ),
                          
//                         )
//                       ],
//                     )

//                     // Row(
//                     //   children: [
//                     //     Container(
//                     //       child: ListView(
//                     //         children: [
//                     //           InkWell(
//                     //             child: Container(
//                     //               // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Gcolors.primaryColor400),
//                     //               child: Text(
//                     //                 'FLAT',
//                     //                 style: TextStyle(
//                     //                     fontSize: 24,
//                     //                     color: Gcolors.primaryColor400),
//                     //               ),
//                     //             ),
//                     //           )
//                     //         ],
//                     //       ),
//                     //     )
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _OnDaySelected(DateTime day, DateTime focusedDay) {
//     setState(() {
//       Today = day;
//     });
//   }
// }
