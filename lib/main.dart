import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Tajwid"),
        ),
        body: _PageList());
  }
}
//class
class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> namaHukum = [
    "Izhar Halqi",
    "Idgham Bigunnah",
    "Idgham Billaghunnah",
    "Iqlab",
    "Ikhfa Hakiki"
    ];


  List<String> isiPenjelasan = [
    "Izhar secara bahasa artinya jelas dan izhar halqi adalah hukum bacaan apabila nun mati atau tanwin bertemu dgn salah satu huruf izhar halqi. Adapun halqi sendiri berarti tenggorokan, maka cara mengucapkannya harus jelas juga, huruf-huruf tersebut antara lain alif atau hamzah(ء), kha’ (خ), ‘ain (ع), ha’ (ح) , ghain (غ), dan ha’ (ﮬ). Contoh bacaannya adalah  : نَارٌ حَامِيَةٌ",
    "Idgham Bighunnah artinya melebur disertai dengungan atau yang berarti memasukkan salah satu huruf nun mati atau tanwin kedalam huruf sesudahnya dan lafal dari idgham bigunnah tersebut haruslah mendengung jika bertemu empat huruf berikut yakni : nun (ن), mim (م), wawu (و) dan ya’ (ي). Contoh bacaan idgham bigunnah : مُّمَدَّدَةٍ عَمَدٍ فِيْ",
    "Idgham Bilaghunnah artinya melebur tanpa dengung atau memasukkan huruf nun mati atau tanwin kedalam huruf sesudahnya tanpa disertai suara mendengung. Hukum bacaan tersebut berlaku jika nun atau tanwin bertemu huruf berikut lam dan ra’. Contoh bacaannya :  لَمْ مَنْ Meskipun demikian hukum ini tidak berlaku apabila nun mati atau tanwin serta huruf tersebut tidak ada dalam satu kata contohnya  اَدُّنْيَا. Jika demikian nun atau tanwin tetap harus dibaca dengan jelas..",
    "Iqlab adalah suatu hukum bacaan Al Quran yang terjadi apabila nun mati atau tanwin bertemu dengan satu huruf saja yaitu huruf  ba’ (ب). Di dalam bacaan ini, bacaan nun mati atau tanwin tidak lagi dibaca sebagai nun atau tanwin berubah menjadi bunyi huruf mim (م). Contoh bacaan iqlab : لَيُنۢبَذَنَّ",
    "Ikhfa memiliki arti menyamarkan, hukum bacaan ini berlaku apabila huruf nun mati atau tanwin bertemu dgn huruf-huruf ikhfa yakni  ta’(ت), tha’ (ث), jim (ج), dal (د), dzal (ذ), zai (ز), sin (س), syin (ش), sod (ص), dhod (ض), , fa’ (ف), qof (ق), dan huruf  kaf (ك). Jika bertemu dengan huruf-huruf tersebut  maka nun mati atau tanwin tersebut  harus dibaca samar atau antara bacaan Izhar dan bacaan Idgham.  Contoh bacaan ikhfa haqiqi: نَقْعًا فَوَسَطْنَ"
  ];


  List<String> contohHuruf= [
    "ء،خ،ع،ح،غ،ه",
    "ي،ن،م،و",
    "ل،ر",
    "ب",
    "ت،ث،ج،د،ذ،ز،س،ش،ص،ض،ف،ق،ك",
   ];

  List<String> gambar = [
    "images/image.jpg",
    "images/image.jpg",
    "images/image.jpg",
    "images/image.jpg",
    "images/image.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: namaHukum.length,
        itemBuilder: (BuildContext contex, int index) {
          final title = namaHukum[index].toString();
          final subTitle = isiPenjelasan[index].toString();
          final desc = contohHuruf[index].toString();
          final img = gambar[index].toString();
          return Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                    child: topContent(title, desc),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                          itemNama: title,
                          itemIsi: subTitle,
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}

backgroundImage(String gambar) {
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}


topContent(String nama, String deskripsi) {
  return new Container(
    height: 120,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderText,
          ),
          Container(
            height: 3,
            width: 150,
            color: Colors.green,
          ),

          Text(
            deskripsi,
            style: descHeaderText,
          ),
        ],
      ),
    ),
  );
}

final baseTextStyle = const TextStyle(color: Colors.black, fontFamily: 'arial');

final bigHeaderText =
baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white) ;

final descHeaderText =
baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

final footerHeaderText =
baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
