// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hnh/diary.dart';
import 'package:intl/intl.dart';

import 'main.dart';

User fromMapUser(Map<dynamic, dynamic> document) {
  late User usr;
  if (document.isNotEmpty) {
    usr = User(document['username'], document['password']);
  }
  return usr;
}

class User {
  String? username;
  String? password;
  User(this.username, this.password);
  dynamic getName() => username;
}

class UserList {
  static late Map<String, User> users;
  Future<void> getUsers() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.get().then((value) => {
          value.docs.forEach((element) {
            setState() {
              users[element.data()['username']] = fromMapUser(element.data());
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controller1.text,
        password: _controller2.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: "Password yếu", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "Email đã được sử dụng", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      }
    }
  }

  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controller1.text, password: _controller2.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        register();
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "Sai mật khẩu", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      }
    }
  }

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
                controller: _controller1,
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
                controller: _controller2,
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
