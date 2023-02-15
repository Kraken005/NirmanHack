import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/constants/color_constants.dart';

class NotifModel {
  String? notifName;
  String? notifDt;

  NotifModel(this.notifName, this.notifDt);
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List main_notif_list = [
    ['Flat Assignment', '17th FEB - 12:30pm'],
    ['DE Assignment', '18th FEB - 12:30pm'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Gcolors.neutralColor1000,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 24),
                child: Text(
                  'NOTIFICATION',
                  style: TextStyle(
                      fontSize: 18,
                      color: Gcolors.primaryColor050,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: main_notif_list.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Container(
                    height: 99,
                    width: 342,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Gcolors.neutralColor900),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Gcolors.neutralColor400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.list_rounded,
                                      color: Gcolors.primaryColor050,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          main_notif_list[index][0],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              color: Gcolors.primaryColor050),
                                        ),
                                        Text(
                                          main_notif_list[index][0],
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              color: Gcolors.primaryColor400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Gcolors.neutralColor400,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
