// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class chatWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _chatState();
  }
}

class _chatState extends State<chatWindow> {
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
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, bottom: 40, right: 0),
                width: 300,
                alignment: Alignment.bottomLeft,
                child: TextField(
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
                    onPressed: () {},
                    icon: Image.asset('assets/images/send.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
