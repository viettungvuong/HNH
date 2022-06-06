// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hnh/main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'login.dart';

class Diary {
  late String username;
  late DateTime date;
  late String content;
  Diary(String str1, String str2, String str3) {
    username = str1;
    content = str2;
    date = DateFormat('dd-MM-yyyy').parse(str2);
  }
}

Diary fromMapDiary(Map<dynamic, dynamic> document) {
  late Diary diary;
  if (document.isNotEmpty) {
    diary = Diary(document['username'], document['date'], document['content']);
  }
  return diary;
}

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
  Map diary = new Map();

  Map findDiary(String id) {
    //khi goi ta se dua vao currentUsr.uid
    //ham tim tat ca nhat ki lien quan toi user
    var data = new Map();

    //o duoi ta se lay tung document co trong collection currentUsr.uid

    getData() async {
      return await FirebaseFirestore.instance.collection(currentUsr!.uid).get();
    }

    getData().then((value) {
      for (var i in value.docs) {
        data[i.data()['date']] = i.data()['content'];
      }
    });

    return data;
  }

  void write(String input) {
    //ham viet tam su
    setState(() {
      tamSu = input;
      //bay gio se truy cap vao collection voi ten user
      diary[DateFormat('dd-MM-yyyy').format(DateTime.now())] = input;
    });
  }

  void openDate(DateTime date) {}

  static String getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  DateTime focused = DateTime.now();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    diary = findDiary(currentUsr!
        .uid); //do cai currentUsr co the la null nen phai de dau cham than
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
