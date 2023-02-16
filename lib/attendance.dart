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
