import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Gcolors.neutralColor1000,
    );
  }
}