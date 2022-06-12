import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'data/cauHoi.dart';
import 'main.dart';

class quiz {
  static int soDiem = 0;
}

class cauHoi {
  final String hoi;
  cauHoi({
    required this.hoi,
  });
  static List<cauHoi> getListCauHoi() => cacCauHoi
      .map(
        (element) => cauHoi(
          hoi: element['cauhoi'],
        ),
      )
      .toList();
}

class quizResult extends StatelessWidget {
  late String loAu, tramCam, stress;
  late Color cl1, cl2, cl3;
  @override
  Widget build(Object context) {
    if (quiz.soDiem * 2 <= 7) {
      loAu = "Bình thường";
      cl1 = Colors.green;
    } else if (quiz.soDiem * 2 >= 8 && quiz.soDiem * 2 <= 9) {
      loAu = "Nhẹ";
      cl1 = Color.fromARGB(255, 167, 153, 25);
    } else if (quiz.soDiem * 2 >= 10 && quiz.soDiem * 2 <= 14) {
      loAu = "Vừa";
      cl1 = Colors.orange;
    } else if (quiz.soDiem * 2 >= 15 && quiz.soDiem * 2 <= 19) {
      loAu = "Nặng";
      cl1 = Colors.redAccent;
    } else {
      loAu = "Rất nặng";
      cl1 = Colors.red;
    }
    if (quiz.soDiem * 2 <= 9) {
      tramCam = "Bình thường";
      cl2 = Colors.green;
    } else if (quiz.soDiem * 2 >= 10 && quiz.soDiem * 2 <= 13) {
      tramCam = "Nhẹ";
      cl2 = Color.fromARGB(255, 167, 153, 25);
    } else if (quiz.soDiem * 2 >= 14 && quiz.soDiem * 2 <= 20) {
      tramCam = "Vừa";
      cl2 = Colors.orange;
    } else if (quiz.soDiem * 2 >= 21 && quiz.soDiem * 2 <= 27) {
      tramCam = "Nặng";
      cl2 = Colors.redAccent;
    } else {
      tramCam = "Rất nặng";
      cl2 = Colors.red;
    }
    if (quiz.soDiem * 2 <= 14) {
      stress = "Bình thường";
      cl3 = Colors.green;
    } else if (quiz.soDiem * 2 >= 15 && quiz.soDiem * 2 <= 18) {
      stress = "Nhẹ";
      cl3 = Color.fromARGB(255, 167, 153, 25);
    } else if (quiz.soDiem * 2 >= 19 && quiz.soDiem * 2 <= 25) {
      stress = "Vừa";
      cl3 = Colors.orange;
    } else if (quiz.soDiem * 2 >= 26 && quiz.soDiem * 2 <= 33) {
      stress = "Nặng";
      cl3 = Colors.redAccent;
    } else {
      stress = "Rất nặng";
      cl3 = Colors.red;
    }
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                  child: Text(
                    "Số điểm cuối cùng của bạn là: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
                  child: Container(
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    height: 10.h,
                    child: Text(
                      "${quiz.soDiem * 2}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: 33.3.w,
                        child: Text(
                          "Lo âu:\n$loAu",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: cl1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 33.3.w,
                        child: Text(
                          "Trầm cảm:\n$tramCam",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: cl2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 33.3.w,
                        child: Text(
                          "Stres:\n$stress",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: cl3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Text(
                        "Nếu kết quả ở ngưỡng bình thường thì tâm lý bạn vẫn đang được cân bằng tốt.\n\nNếu bắt đầu chuyển sang độ nhẹ, bạn cần chú ý đến cảm xúc của mình. Bạn nên tự điều chỉnh suy nghĩ bản thân trước, tránh để tâm trạng ngày càng tệ.\n\nVà nếu đang ở mức độ vừa trở lên, bần cần thăm khám bác sĩ chuyên khoa.",
                        style: TextStyle(fontSize: 12.sp))),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 2.h),
                  width: 20.w,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mainWidget()),
                      );
                    },
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainWidget()),
                          );
                        },
                        icon: Image.asset('assets/images/Logo11.png')),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class quizPage extends StatelessWidget {
  final int i;

  const quizPage(
    this.i, {
    Key? key,
  }) : super(key: key);

  void tapChoice(int choice) {
    quiz.soDiem += choice;
  }

  @override
  Widget build(BuildContext context) {
    final ds = cauHoi.getListCauHoi();
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
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 20.h,
                      color: Colors.blue,
                      child: Text(
                        ds[i].hoi,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.white,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      "${i + 1}/${ds.length}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      "Số điểm hiện tại: ${quiz.soDiem * 2}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: () {
                            tapChoice(0);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (i + 1 < ds.length)
                                      ? quizPage(i + 1)
                                      : quizResult()),
                            );
                          },
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: () {
                            tapChoice(1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (i + 1 < ds.length)
                                      ? quizPage(i + 1)
                                      : quizResult()),
                            );
                          },
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: FloatingActionButton(
                          heroTag: "btn3",
                          onPressed: () {
                            tapChoice(2);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (i + 1 < ds.length)
                                      ? quizPage(i + 1)
                                      : quizResult()),
                            );
                          },
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: FloatingActionButton(
                          heroTag: "btn4",
                          onPressed: () {
                            tapChoice(3);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (i + 1 < ds.length)
                                      ? quizPage(i + 1)
                                      : quizResult()),
                            );
                          },
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
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
