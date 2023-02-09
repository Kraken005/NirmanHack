import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Task({
  super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10),
      child: Container(
       // padding: EdgeInsets.all(12),
        color: Gcolors.neutralColor900,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Gcolors.neutralColor900, 
              ),
              child: Row(
                children: [
                 Checkbox(value:taskCompleted, onChanged: onChanged),
                  Text(
                    taskName,
                    //'Zairza App Design',
                style: TextStyle(
                    fontSize: 19,
                    color: Gcolors.primaryColor050
                    //decoration: taskCompleted
                      //  ? TextDecoration.lineThrough
                        //: TextDecoration.none
                        ),
              ),
              SizedBox(width: 100),
              Icon(Icons.edit,size: 25,color: Gcolors.primaryColor400,),
              Divider(
                color: Gcolors.primaryColor050,
                thickness: 2,
              )
                  // Text("Zaiza App Design",style: TextStyle(fontSize: 14,color: Gcolors.primaryColor050),)
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}