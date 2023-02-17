import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import '../constants/color_constants.dart';

class modalInput extends StatefulWidget {
  final Function addEvents;
  const modalInput({super.key, required this.addEvents});

  @override
  State<modalInput> createState() => _modalInputState();
}

class _modalInputState extends State<modalInput> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 00, minute: 00);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredDescription = descriptionController.text;

    if (enteredTitle.isEmpty || enteredDescription.isEmpty) {
      return;
    }

    widget.addEvents(
      titleController.text,
      descriptionController.text,
      _selectedDate,
      _selectedTime,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      //firstTime: TimeOfDay(hour: ),
      //lastDate: DateTime(2030)
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      } else {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(color: Gcolors.neutralColor900),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (value) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descriptionController,
              onSubmitted: (value) => submitData,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text('Choose Date'),
                ),
                Expanded(
                  child: Text(_selectedTime == null
                      ? 'No Time chosen'
                      : 'Picked Time: ${formatDate(DateTime(2019, 08, 1, _selectedTime.hour, _selectedTime.minute), [
                              hh,
                              ':',
                              nn,
                              " ",
                              am
                            ]).toString()}'),
                ),
                TextButton(
                  onPressed: _presentTimePicker,
                  child: Text('Choose Time'),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: submitData, child: Text('Add Transaction')),
            InkWell(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection("Todo")
                      .add({"title": "Zairza", "description": "Club in Uni"});
                },
                child: Text('data')),
          ],
        ),
      ),
    );
  }
}
