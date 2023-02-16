import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';

class MySquare extends StatelessWidget {
  final String Name;

  const MySquare({super.key, required this.Name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Container(
        height: 135,
        //color: Gcolors.neutralColor400,
        decoration: BoxDecoration(
            color: Gcolors.neutralColor1000,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Gcolors.primaryColor050),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      '60%',
                      style: TextStyle(
                          color: Gcolors.primaryColor300,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'Attendance: ',
                    style:
                        TextStyle(fontSize: 14, color: Gcolors.neutralColor400),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                        fontSize: 14,
                        color: Gcolors.primaryColor050,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/',
                    style: TextStyle(
                        color: Gcolors.primaryColor050,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                        fontSize: 14,
                        color: Gcolors.primaryColor050,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 117),
                  // Icon(
                  //   Icons.check_circle,
                  //   color: Gcolors.primaryColor400,
                  // ),
                  // SizedBox(
                  //   width: 12,
                  // ),
                  // Icon(
                  //   Icons.highlight_off,
                  //   color: Colors.red,
                  // )
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Status : ',
                        style: TextStyle(
                            fontSize: 14, color: Gcolors.primaryColor050),
                      ),
                      Text(
                        'Attend next 12 classes to get back on track',
                        style: TextStyle(color: Gcolors.primaryColor050),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 12),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,                 // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:Gcolors.primaryColor400),
                            child: Text(
                              'PRESENT',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Gcolors.neutralColor900),
                            ))),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Gcolors.neutralColor1000,
                              side: BorderSide(
                                width: 2,
                                color: Colors.red.shade400,
                                
                              )
                                ),
                            child: Text(
                              'ABSENT',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Gcolors.primaryColor050),
                            ))),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        height: 40,
                        width: 70,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: Gcolors.neutralColor400
                              ),
                                backgroundColor: Gcolors.neutralColor1000),
                            child: Text(
                              'UNDO',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Gcolors.neutralColor400),
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
