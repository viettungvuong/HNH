import 'package:flutter/material.dart';
import 'package:hnh/data/baiTapGiamCan.dart';
import 'package:hnh/data/baiTapTangCan.dart';

List dsBaiTap = [];

class baiTap {
  final String name;
  final String moTa;
  final String cacBuoc;
  baiTap({
    required this.name,
    required this.moTa,
    required this.cacBuoc,
  });

  static List<baiTap> getListBaiTapTangCan() => baiTapTangCan
      .map(
        (element) => baiTap(
          name: element['ten'],
          moTa: element['moTa'],
          cacBuoc: element['cacBuoc'],
        ),
      )
      .toList();

  static List<baiTap> getListBaiTapGiamCan() => baiTapGiamCan
      .map(
        (element) => baiTap(
          name: element['ten'],
          moTa: element['moTa'],
          cacBuoc: element['cacBuoc'],
        ),
      )
      .toList();
}

class baiTapPage extends StatelessWidget {
  const baiTapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ds = baiTap.getListBaiTapGiamCan();

    return Scaffold(
      appBar: AppBar(
        title: Text('Các bài tập giảm cân'),
      ),
      body: baiTapList(
        baitap: ds,
        onTapItem: (baiTap baitap) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => baiTapDetailView(baitap)),
          );
        },
      ),
    );
  }
}

class baiTapList extends StatelessWidget {
  final List<baiTap> baitap;
  final Function(baiTap) onTapItem;

  const baiTapList({
    Key? key,
    required this.baitap,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: baitap.length,
      itemBuilder: (context, index) {
        final bt = baitap[index];
        return ListTile(
          key: Key('list_item_$index'),
          //leading: Image.network(SMALL_POSTER_BASE_URL + movie.posterPath),
          title: Text(bt.name),
          contentPadding: EdgeInsets.all(12.0),
          onTap: () {
            onTapItem.call(bt);
          },
        );
      },
    );
  }
}

class baiTapChiTiet extends StatelessWidget {
  final baiTap bt;

  const baiTapChiTiet(
    this.bt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: baiTapDetailView(bt),
    );
  }
}

class baiTapDetailView extends StatelessWidget {
  final baiTap bt;

  const baiTapDetailView(
    this.bt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(LARGE_POSTER_BASE_URL + movie.posterPath),
          ),*/
            SizedBox(height: 24.0),
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                color: Colors.blue,
                child: Text(
                  bt.name,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              bt.moTa,
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 24.0),
            Text(
              bt.cacBuoc,
              style: TextStyle(fontSize: 20, height: 1.6),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
