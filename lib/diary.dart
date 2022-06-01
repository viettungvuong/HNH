// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class diaryWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diaryState();
  }
}

class _diaryState extends State<diaryWindow> {
  String tamSu = "";

  void write(String input) {
    //ham viet tam su
    setState(() {
      tamSu = input;
    });
  }

  String getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  final TextEditingController _controller = new TextEditingController();
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
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                getCurrentDate(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 90, left: 40, bottom: 400),
              child: Text(
                "$tamSu",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(top: 100, bottom: 40),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 40, right: 0),
                    width: 300,
                    alignment: Alignment.bottomLeft,
                    child: TextField(
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
