// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hnh/main.dart';
import 'package:tab_container/tab_container.dart';

User? currentUsr;

class loginWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<loginWindow> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  Future register() async {
    if (_controller4.text != _controller5.text) {
      Fluttertoast.showToast(
        msg: "Password khác nhau khi nhập lại!", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
      );
    } else {}
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controller3.text.trim(), password: _controller4.text.trim());
      currentUsr = FirebaseAuth.instance.currentUser!;
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          firstName: _controller6.text,
          id: currentUsr!.uid, // UID from Firebase Authentication
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainWidget()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "Email đã được sử dụng", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: "Mật khẩu quá yếu", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      }
    }
  }

  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controller1.text.trim(), password: _controller2.text.trim());
      currentUsr = FirebaseAuth.instance.currentUser!;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainWidget()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "Sai mật khẩu", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: "Chưa có tài khoản", // message
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Trangch.png'),
                fit: BoxFit.cover),
          ),
          child: SizedBox(
            child: TabContainer(
              tabEdge: TabEdge.bottom,
              tabCurve: Curves.easeIn,
              childPadding: EdgeInsets.symmetric(vertical: 50),
              colors: const <Color>[
                Colors.lightBlue,
                Colors.lightBlueAccent,
              ],
              // ignore: sort_child_properties_last
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 50, left: 50, bottom: 10),
                        child: Text(
                          "Email:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                          controller: _controller1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 10),
                        child: Text(
                          "Password:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          controller: _controller2,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            login();
                          },
                          icon: Icon(
                            // <-- Icon
                            Icons.login,
                            size: 34.0,
                          ),
                          label: Text('Tiếp tục'), // <-- Text
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 30, left: 50, bottom: 10),
                        child: Text(
                          "Email:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                          controller: _controller3,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 10),
                        child: Text(
                          "Password:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          controller: _controller4,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 10),
                        child: Text(
                          "Nhập lại Password:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          controller: _controller5,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 10),
                        child: Text(
                          "Tên:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: 40, right: 0),
                        width: 300,
                        child: TextField(
                          controller: _controller6,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            register();
                          },
                          icon: Icon(
                            // <-- Icon
                            Icons.login,
                            size: 34.0,
                          ),
                          label: Text('Tiếp tục'), // <-- Text
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              tabs: [
                'Đăng nhập',
                'Đăng ký',
              ],
            ),
          ),
        ),
      ),
    );
  }
}
