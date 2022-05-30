// ignore_for_file: prefer_const_constructors

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
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 50, left: 50, right: 50),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Hãy tâm sự gì đó',
            ),
          ),
        ),
      ),
    );
  }
}
