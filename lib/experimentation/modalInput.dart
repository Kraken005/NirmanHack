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
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Gcolors.neutralColor400),
                  borderRadius: BorderRadius.circular(24)),
              height: 48,
              width: 366,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  style:
                      TextStyle(fontSize: 14, color: Gcolors.neutralColor400),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Gcolors.primaryColor050),
                  ),
                  controller: titleController,
                  onSubmitted: (value) => submitData,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Gcolors.neutralColor400),
                  borderRadius: BorderRadius.circular(12)),
              width: 366,
              height: 192,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: TextField(
                  minLines: 1,
                  maxLines: 4,
                  style:
                      TextStyle(fontSize: 14, color: Gcolors.neutralColor400),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Gcolors.primaryColor050),
                  ),
                  controller: descriptionController,
                  onSubmitted: (value) => submitData,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen'
                      : '${DateFormat.yMd().format(_selectedDate)}'),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                  ),
                ),
                Expanded(
                  child: Text(_selectedTime == null
                      ? 'No Time chosen'
                      : '${formatDate(DateTime(2019, 08, 1, _selectedTime.hour, _selectedTime.minute), [
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
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  FirebaseFirestore.instance.collection("Todo").add({
                    "title": titleController.text,
                    "description": descriptionController.text
                  });
                },
                child: Text('Add to firebase')),
          ],
        ),
      ),
    );
  }
}
