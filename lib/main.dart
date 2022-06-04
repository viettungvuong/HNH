// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hnh/chat.dart';
import 'package:hnh/diary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: mainWidget(),
    ),
  );
}

class mainWidget extends StatelessWidget {
  static String? username;
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator mainWidget - FRAME
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Trangch.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 100, bottom: 40),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon03.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon02.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon01.png'),
                      iconSize: 60,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 100, bottom: 40),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon_row204.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon_row203.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon_row202.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Icon_row201.png'),
                      iconSize: 60,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 100, bottom: 10),
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
                    width: 100,
                    height: 100.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => chatWindow()),
                        );
                      },
                      icon: Image.asset('assets/images/Icon_row302.png'),
                      iconSize: 60,
                    ),
                  ),
                  SizedBox(
                    width: 100,
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
  }
}
