import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemNama;
  final String itemIsi;

  const DetailPage(
      {Key key, this.itemNama, this.itemIsi})
      : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Detail " + itemNama,
              style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemNama,
                  style: TextStyle(color: Colors.green, fontSize: 24),
                ),
                SizedBox(height: 10,),
                Text(itemIsi),
              ]),
        ));
  }
}
