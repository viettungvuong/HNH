// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hnh/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'login.dart';

Map? diary = new Map();

Future<void> findDiary(String id) async {
  //khi goi ta se dua vao currentUsr.uid
  //ham tim tat ca nhat ki lien quan toi user

  //o duoi ta se lay tung document co trong collection currentUsr.uid

  getData() async {
    return await FirebaseFirestore.instance.collection(currentUsr!.uid).get();
  }

  getData().then((value) {
    for (var i in value.docs) {
      diary![i.id] = i.data()['content']; //luu vao map
    }
  });
}

class diaryWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diaryState();
  }
}

class _diaryState extends State<diaryWindow> {
  bool firstOpened = false;
  bool showCalendar = false;
  String tamSu = "";
  TableCalendar? calendar;

  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  void write(String input) {
    //ham viet tam su
    setState(() {
      tamSu += input;
      diary![date] = input;
    }); //bay gio se truy cap vao collection voi ten user
    var collection = FirebaseFirestore.instance.collection(currentUsr!.uid);
    collection
        .doc(date) // <-- Doc ID where data should be updated.
        .set({'content': input}) // <-- Updated data
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
  }

  void openDate(DateTime chosenDate) {
    setState(() {
      showCalendar = false;
      date = DateFormat('dd-MM-yyyy').format(chosenDate);
      tamSu = (diary![date] == null ? "" : diary![date])!;
    });
  }

  DateTime focused = DateTime.now();
  DateTime selected = DateTime.now();

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    var likesRef =
        FirebaseFirestore.instance.collection(currentUsr!.uid).doc(date);
    likesRef.get().then((value) {
      String todayDiary = value.data()!['content'];
      setState(() {
        tamSu = todayDiary;
      });
      // o day minh dung then tai vi khi moi mo thi firebase no se chua load kip lien document tren firestore
      // vi the ma ta phai doi no xong roi tien hanh tiep
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Trangch.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.only(top: 5.h, left: 5.h, right: 50.w),
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
                          padding: EdgeInsets.only(top: 5.h, right: 10.w),
                          child: Transform.scale(
                            scale: 1.5,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showCalendar =
                                        ((showCalendar) ? false : true);
                                  });
                                },
                                icon:
                                    Image.asset('assets/images/Calendar.png')),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        date,
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
                          selectedDayPredicate: (day) =>
                              isSameDay(selected, day),
                          onPageChanged: (focusedDay) {
                            setState(() {
                              focused = focusedDay;
                            });
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              focused = focusedDay;
                              selected = selectedDay;
                              _controller.clear();
                              openDate(focused); //mo coi diary cua ngay do
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 40),
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
                            padding: EdgeInsets.only(left: 3.w, bottom: 5.h),
                            width: 80.w,
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
                            padding: EdgeInsets.only(left: 5.w, bottom: 10.h),
                            alignment: Alignment.bottomRight,
                            child: Transform.scale(
                              scale: 1.5,
                              //bat buoc phai quang vao sizedbox vi iconbutton can parent
                              child: IconButton(
                                onPressed: () {
                                  write(_controller.text);
                                  _controller.clear();
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
      },
    );
  }
}
