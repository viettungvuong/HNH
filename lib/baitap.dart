import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class baiTap {
  String? name;
  String? moTa;
  String? cacBuoc;
  baiTap(this.name, this.moTa, this.cacBuoc);
}

class baiTapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _baiTapState();
  }
}

class _baiTapState extends State<baiTapWidget> {
  String name = "";
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('baiTapGiamCan')
                .snapshots(),
            builder: (context, snapshot) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  setState(() {
                    name = data.toString();
                  });
                  return ListTile(
                    title: Text(
                      name,
                      style: TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      (data['moTa'] ?? ""),
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () {
                      slideDialog.showSlideDialog(
                        context: context,
                        child: Column(
                          children: [
                            Image(image: AssetImage('assets/images/$name.png')),
                            Text(
                              data['cacBuoc'],
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                        pillColor: Colors.lightBlueAccent,
                        backgroundColor: Colors.white,
                      );
                    },
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
