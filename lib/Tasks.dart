import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/TaskComponents.dart';
import 'constants/color_constants.dart';
import 'package:intl/intl.dart';

class ToDoTask extends StatefulWidget {
  // final String taskName;
  // final bool? taskCompleted;
  // Function(bool?)? onChanged;
  final List<TaskComponent> events;

  ToDoTask(
      {super.key,
      // required this.taskName,
      // required this.taskCompleted,
      // required this.onChanged,
      required this.events});

  @override
  State<ToDoTask> createState() => _ToDoTaskState();
}

class _ToDoTaskState extends State<ToDoTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 10, right: 15, bottom: 10),
              decoration: BoxDecoration(
                  color: Gcolors.neutralColor900,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Container(
                  child: Text('Checkbox'),
                ),
                title: Text(widget.events[index].title),
                subtitle: Text(DateFormat.yMMMEd().format(widget.events[index].date)),
                trailing:
                    Icon(Icons.edit_document, color: Gcolors.primaryColor400),
              ));
          // return ToDoTask(
          //     taskName: TaskList[index][0],
          //     taskCompleted: TaskList[index][1],
          //     onChanged: (value) =>
          //         checkBoxChanged(value, index));
        },
      ),
    );
    // return Container(
    //   padding: EdgeInsets.only(left: 10, right: 15, bottom: 10),
    //   decoration: BoxDecoration(
    //       color: Gcolors.neutralColor900,
    //       borderRadius: BorderRadius.circular(20)),
    //   child: Column(
    //     children: [
    //       Row(
    //         //crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Transform.scale(
    //             scale: 1.2,
    //             child: Checkbox(
    //               value: taskCompleted,
    //               onChanged: onChanged,
    //               activeColor: Gcolors.primaryColor400,
    //               checkColor: Gcolors.neutralColor1000,
    //               side: MaterialStateBorderSide.resolveWith((states) =>
    //                   BorderSide(width: 2, color: Gcolors.primaryColor050)),
    //             ),
    //           ),
    //           Text(
    //             taskName,
    //             style: TextStyle(fontSize: 18, color: Gcolors.primaryColor050),
    //           ),
    //           SizedBox(width: MediaQuery.of(context).size.width / 10),
    //           Icon(Icons.edit_document, color: Gcolors.primaryColor400),
    //         ],
    //       ),
    //       Divider(
    //         thickness: 1,
    //         color: Gcolors.primaryColor050,
    //       )
    //     ],
    //   ),
    // );
  }
}
