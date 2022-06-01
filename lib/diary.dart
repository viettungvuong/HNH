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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 150),
              child: Text(
                getCurrentDate(),
                style: TextStyle(fontSize: 30),
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
