// ignore_for_file: prefer_const_constructors

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

User fromMapUser(Map<dynamic, dynamic> document) {
  late User usr;
  usr = new User(document['username'], document['password']);
  return usr;
}

class User {
  String? username;
  String? password;
  User(this.username, this.password);
  dynamic getName() => username;
}

class UserList {
  late List<User> users;
  Future<void> getUsers() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.get().then((value) => {
          value.docs.forEach((element) {
            setState() {
              users.add(fromMapUser(element.data()));
            }
          })
        });
  }
}

class loginWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<loginWindow> {
  void login() {}

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
