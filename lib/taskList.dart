import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/model/TaskComponents.dart';

class taskList extends StatefulWidget {
  const taskList({super.key});

  @override
  State<taskList> createState() => _taskListState();
}

class _taskListState extends State<taskList> {
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

  void addEvents(String title, String description, DateTime date,
      TimeOfDay time, String id) {
    final newEvent = TaskComponent(
        title: title, description: description, date: date, time: time, id: DateTime.now().toString()
        // time: time, id: id
         );

    setState(() {
      events.add(newEvent);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      events.removeWhere((tx) => tx.id == id);
    });
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
