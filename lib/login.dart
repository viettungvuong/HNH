// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class loginWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<loginWindow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 40),
              child: Text("Username:",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, bottom: 40, right: 0),
              width: 300,
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Text("Password",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, bottom: 40, right: 0),
              width: 300,
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
