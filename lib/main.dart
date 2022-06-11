// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hnh/baitap.dart';
import 'package:hnh/chat.dart';
import 'package:hnh/chat_page.dart';
import 'package:hnh/diary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hnh/login.dart';
import 'package:hnh/users_page.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

String currentName = "";
getName() async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUsr!.uid)
      .get()
      .then((value) {
    currentName = value.data()!['firstName'];
  });
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'HNH',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: loginWindow(),
    ),
  );
}

class mainWidget extends StatelessWidget {
  static String? username;

  @override
  Widget build(BuildContext context) {
    check();
    getName();

    // Figma Flutter Generator mainWidget - FRAME

    return Sizer(
      builder: (context, orientation, deviceType) {
        return WillPopScope(
          onWillPop: () async {
            // You can do some work here.
            // Returning true allows the pop to happen, returning false prevents it.
            return false;
          },
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Trangch.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Fluttertoast.showToast(
                            msg: "Đã đăng xuất", // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.CENTER, // location
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginWindow()),
                          );
                        },
                        icon: Image.asset('assets/images/Logout.png'),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "YOUR BODY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ActionManShaded',
                        ),
                      )),
                  Container(
                    width: 80.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 100,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon03.png'),
                            iconSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                          height: 100.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon02.png'),
                            iconSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                          height: 100,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon01.png'),
                            iconSize: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "HEAL YOUR SOUL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ActionManShaded',
                        ),
                      )),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 100.0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => baiTapPage()),
                              );
                            },
                            icon: Image.asset('assets/images/Icon_row204.png'),
                            iconSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                          height: 100.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon_row203.png'),
                            iconSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                          height: 100.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon_row202.png'),
                            iconSize: 60,
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                          height: 100.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon_row201.png'),
                            iconSize: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "YOU WANNA TELL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ActionManShaded',
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 25.w,
                        height: 100.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UsersPage()),
                            );
                          },
                          icon: Image.asset('assets/images/Icon_row302.png'),
                          iconSize: 60,
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                        height: 100.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => diaryWindow()),
                            );
                          },
                          icon: Image.asset('assets/images/Icon_row301.png'),
                          iconSize: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
