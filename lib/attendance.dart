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
