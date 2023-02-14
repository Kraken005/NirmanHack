import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav.dart';
import 'Homepage.dart';
//import 't';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: NavigationBarPage(),
    );
  }
}