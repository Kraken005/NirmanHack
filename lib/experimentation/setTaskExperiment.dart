import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import '../constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import './setTaskExperiment.dart';
import '../model/TaskComponents.dart';

class SettaskExperiment extends StatefulWidget {
  final Function addEvents;
  const SettaskExperiment({super.key, required this.addEvents});

  @override
  State<SettaskExperiment> createState() => _SettaskExperimentState();
}

class _SettaskExperimentState extends State<SettaskExperiment> {
  double? _height;
  double? _width;

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  // final List<TaskComponent> events = [
  //   TaskComponent(
  //       title: 'Zairza App Work',
  //       description: 'Design and deploy Zairza App',
  //       date: DateTime.now(),
  //       time: TimeOfDay.now(),
  //       id: DateTime.now().toString()),
  //   TaskComponent(
  //       title: 'Flat Assignment',
  //       description: 'Score full marks in Flat assignment',
  //       date: DateTime.now(),
  //       time: TimeOfDay.now(),
  //       id: DateTime.now().toString()),
  //   TaskComponent(
  //       title: 'Coffee Date with Barsha',
  //       description: 'At Radium Cafe',
  //       date: DateTime.now(),
  //       time: TimeOfDay.now(),
  //       id: DateTime.now().toString()),
  //   TaskComponent(
  //       title: 'Switch to "Switch"',
  //       description: 'Ditch Zairza',
  //       date: DateTime.now(),
  //       time: TimeOfDay.now(),
  //       id: DateTime.now().toString()),
  // ];

  // void addEvents(String title, String description, DateTime date,
  //     TimeOfDay time, String id) {
  //   final newEvent = TaskComponent(
  //       title: title, description: description, date: date, time: time, id: id);

  //   setState(() {
  //     events.add(newEvent);
  //   });
  // }

  // void deleteTransaction(String id) {
  //   setState(() {
  //     events.removeWhere((tx) => tx.id == id);
  //   });
  // }

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime idcontroller = DateTime.now();
  //DateTime selectedDate = DateTime.now();
  //TimeOfDay selectedTime = TimeOfDay.now();
  bool showDate = false;
  bool showTime = false;

  void submitData(DateTime picked) {
    final enteredTitle = titleController.text;
    final enteredDescription = descriptionController.text;
    final enteredDate = picked;
    final enteredId = DateTime.now();

    print(enteredDate.toString());

    if (enteredTitle.isEmpty || enteredDescription.isEmpty) {
      return;
    }

    widget.addEvents(
      titleController.text,
      descriptionController.text,
      _dateController.text,
      _timeController.text,
      idcontroller,
      // DateTime.parse(_selectDate(context).toString()),
      // TimeOfDay.fromDateTime(DateTime.parse(_selectTime(context).toString())),
      //DateFormat.yMd().format(DateTime.now())
    );
  }

  void printData() {
    print('data');
  }

  // Future _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       initialDatePickerMode: DatePickerMode.day,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2101));
  //   if (picked != null)
  //     setState(() {
  //       selectedDate = picked;
  //       _dateController.text = DateFormat.yMd().format(selectedDate);
  //     });
  // }
  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    return selectedDate;
  }

  // Future<DateTime> _selectDate(BuildContext context) async {
  //   final selected = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (selected != null && selected != selectedDate) {
  //     setState(() {
  //       selectedDate = selected;
  //     });
  //   }
  //   return selectedDate;
  // }

  Future _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });

    return selectedDate;
  }

  // Future<TimeOfDay> _selectTime(BuildContext context) async {
  //   final selected = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (selected != null && selected != selectedTime) {
  //     setState(() {
  //       selectedTime = selected;
  //     });
  //   }
  //   return selectedTime;
  // }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  // TimeOfDay selectedTime = TimeOfDay.now();
  // _selectTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime) {
  //     setState(() {
  //       selectedTime = timeOfDay;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Gcolors.neutralColor1000,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 91),
                child: Row(
                  children: [
                    //Image.asset('assets/images/backicon.png', height: 24, width: 24,),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(homeRoute);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Gcolors.primaryColor100,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12, left: 4),
                      child: Text(
                        'NEW PERSONAL TASK',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Gcolors.primaryColor050),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Gcolors.neutralColor900,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 425,
                      width: 366,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Title',
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            color: Gcolors.primaryColor100,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 64,
                                  width: 334,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Gcolors.primaryColor100)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 23),
                                    child: TextField(
                                      controller: titleController,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              color: Gcolors.primaryColor050,
                                              fontSize: 14)),
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: 'Add Title',
                                              hintStyle: TextStyle(
                                                  color:
                                                      Gcolors.neutralColor400)),
                                      onSubmitted: (value) => submitData,
                                    ),
                                  ),
                                ),
                              ),
                              //description
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Description',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              color: Gcolors.primaryColor100,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 128,
                                  width: 334,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Gcolors.primaryColor100)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 23),
                                    child: TextField(
                                      controller: descriptionController,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                              color: Gcolors.primaryColor050,
                                              fontSize: 14)),
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: 'Add Description',
                                              hintStyle: TextStyle(
                                                  color:
                                                      Gcolors.neutralColor400)),
                                      onSubmitted: (value) => submitData,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 24, bottom: 8),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                Text(
                                                  'Date',
                                                  style: GoogleFonts.inter(
                                                      textStyle: const TextStyle(
                                                          color: Gcolors
                                                              .primaryColor100,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () => _selectDate(context),
                                              child: Container(
                                                height: 64,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        color: Gcolors
                                                            .primaryColor100)),
                                                child: TextFormField(
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  textAlign: TextAlign.center,
                                                  enabled: false,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: _dateController,
                                                  onFieldSubmitted: (value) =>
                                                      submitData,
                                                  onSaved: (String? val) {
                                                    _setDate = val;
                                                  },
                                                  decoration: InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      // labelText: 'Time',
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 0.0)),
                                                ),
                                              ),
                                            ),
                                            // child: Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 4, left: 16),
                                            //   child: DateTimePicker(
                                            //     initialValue: 'choose date',
                                            //     firstDate: DateTime(2000),
                                            //     lastDate: DateTime(2100),
                                            //     dateLabelText: 'Date',
                                            //     decoration:
                                            //         const InputDecoration(
                                            //       border: InputBorder.none,
                                            //     ),
                                            //     style: GoogleFonts.inter(
                                            //         textStyle:
                                            //             const TextStyle(
                                            //       color:
                                            //           Gcolors.neutralColor400,
                                            //       fontSize: 14,
                                            //     )),
                                            //     onChanged: (val) =>
                                            //         print(val),
                                            //     validator: (val) {
                                            //       print(val);
                                            //       return null;
                                            //     },
                                            //     onSaved: (val) {
                                            //       print(val);
                                            //       _setDate = val;
                                            //     },
                                            //     controller: _dateController,
                                            //   ),
                                            // ),
                                          ),
                                        ]),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 24, bottom: 8),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    'Time',
                                                    style: GoogleFonts.inter(
                                                        textStyle: const TextStyle(
                                                            color: Gcolors
                                                                .primaryColor100,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => _selectTime(context),
                                              child: Container(
                                                width: 120,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Gcolors
                                                            .primaryColor100),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: TextFormField(
                                                  onChanged: (value) =>
                                                      submitData,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  textAlign: TextAlign.center,
                                                  onFieldSubmitted: (value) =>
                                                      submitData,
                                                  onSaved: (String? val) {
                                                    _setTime = val;
                                                  },
                                                  enabled: false,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: _timeController,
                                                  decoration: InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      // labelText: 'Time',
                                                      contentPadding:
                                                          EdgeInsets.all(5)),
                                                ),
                                              ),
                                              // child: ElevatedButton(
                                              //   onPressed: () {
                                              //     _selectTime(context);
                                              //   },
                                              //   style: ElevatedButton.styleFrom(
                                              //       backgroundColor:
                                              //           Gcolors.neutralColor900,
                                              //       shape: RoundedRectangleBorder(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 20),
                                              //       )),
                                              //   child: Text(
                                              //     "${selectedTime.hour}:${selectedTime.minute}",
                                              //     style: GoogleFonts.inter(
                                              //         textStyle: const TextStyle(
                                              //             fontSize: 14,
                                              //             color: Gcolors
                                              //                 .neutralColor400)),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              //time
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36, left: 90),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Gcolors.primaryColor400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        onPressed: () async {
                          submitData(await _selectDate(context) as DateTime);
                          // Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Text(
                            'Set task',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Gcolors.neutralColor1000,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    )
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
