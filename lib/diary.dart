// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hnh/main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class diaryWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diaryState();
  }
}

class _diaryState extends State<diaryWindow> {
  bool showCalendar = false;
  String tamSu = "";
  TableCalendar? calendar;

  void write(String input) {
    //ham viet tam su
    setState(() {
      tamSu = input;
      var collection = FirebaseFirestore.instance.collection('messages');
      collection
          .doc(
              '$mainWidget.username_diary_$getCurrentDate()') // <-- Document ID
          .set({
            'content': tamSu,
            'username': mainWidget.username,
            'date': getCurrentDate()
          }) // <-- Your data
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));
    });
  }

  void openDate(DateTime date) {}

  String getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  DateTime focused = DateTime.now();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Trangch.png'),
                fit: BoxFit.cover),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 60, left: 30, right: 260),
                  child: Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainWidget()),
                          );
                        },
                        icon: Image.asset('assets/images/Logo11.png')),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 60, right: 30),
                  child: Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showCalendar = ((showCalendar) ? false : true);
                          });
                        },
                        icon: Image.asset('assets/images/Calendar.png')),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 20),
              child: Text(
                getCurrentDate(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            Visibility(
              visible: (showCalendar),
              child: Container(
                alignment: Alignment.topCenter,
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2040, 3, 14),
                  focusedDay: focused,
                  onPageChanged: (focusedDay) {
                    focused = focusedDay;
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      focused = focusedDay;
                      openDate(focused); //mo coi diary cua ngay do
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  tamSu,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 40, right: 0),
                    width: 350,
                    alignment: Alignment.bottomLeft,
                    child: TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      onSubmitted: (value) {
                        write(_controller.text);
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Hãy tâm sự gì đó',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 50),
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                      scale: 1.5,
                      //bat buoc phai quang vao sizedbox vi iconbutton can parent
                      child: IconButton(
                        onPressed: () {
                          write(_controller.text);
                        },
                        icon: Image.asset('assets/images/send.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
