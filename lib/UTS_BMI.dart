import 'dart:html';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var berat = 0, tinggi = 0, nama = "", teks = "";
  double tmeter = 0, hasil = 0, hasil1, hasilL = 0;

  final TextEditingController b = new TextEditingController();
  final TextEditingController t = new TextEditingController();
  final TextEditingController n = new TextEditingController();

  void hitung() {
    setState(() {
      berat = int.parse(b.text);
      tinggi = int.parse(t.text);
      tmeter = tinggi * 0.010;
      nama = n.text;
      hasil = berat / (tmeter * tmeter);
      hasilL = double.parse(hasil.toStringAsFixed(1));
      if (hasil >= 18.5 && hasil < 23) {
        teks =
            "$nama, Sehat, tapi wajib jaga kesehatan dan rajin berolahraga yah";
      } else if (hasil >= 23 && hasil < 25) {
        teks =
            "$nama, Kelebihan berat badan, Jangan insecure ya, semangat olahraganya";
      } else if (hasil >= 25 && hasil < 30) {
        teks =
            "$nama, Kelebihan berat badan pada obese lvl 1. Tetap bersyukur ya tapi wajib olahraga dan jaga pola makannya";
      } else if (hasil >= 30) {
        teks =
            "$nama, Kelebihan berat badan pada obese lvl 2. Olahraga yuk, pasti bisa kok ";
      } else if (hasil >= 17) {
        teks = "$nama, Kekurangan berat badan. Jangan malas makan ya";
      } else {
        teks = "$nama, Berat badanmu sangat kurang. Jangan malas makan ya";
      }
    });
  }

  void hapus() {
    setState(() {
      b.text = "";
      t.text = "";
      n.text = "";
      teks = "";
      berat = 0;
      tinggi = 0;
      hasil = 0;
      hasilL = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Body Mass Index"),
        backgroundColor: Colors.red,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Center(
                    child: new Text(
                  "Kalkulator BMI",
                  style: new TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                )),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Text(
                    "Cek Kesehatan Anda dengan Mengisi Form di bawah ini:",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 15.0),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new TextField(
                    controller: n,
                    decoration: new InputDecoration(
                        hintText: "Masukan Nama Anda",
                        labelText: "Nama :",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: b,
                    decoration: new InputDecoration(
                        hintText: "Masukkan Berat Badan Anda",
                        labelText: "Berat :",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: t,
                    decoration: new InputDecoration(
                        hintText: "Masukkan Tinggi Anda",
                        labelText: "Tinggi :",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Row(children: <Widget>[
                    new RaisedButton(
                      onPressed: hitung,
                      child: new Text("Hitung"),
                      color: Colors.cyan.shade500,
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(right: 20.0),
                    ),
                    new RaisedButton(
                        onPressed: hapus,
                        child: new Text("Hapus"),
                        color: Colors.cyan.shade500)
                  ]),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Text(
                    "Berat Badan : $berat",
                    style: new TextStyle(fontSize: 17.0),
                  ),
                ),
                new Text(
                  "Tinggi Badan : $tinggi",
                  style: new TextStyle(fontSize: 17.0),
                ),
                new Text(
                  "NIlai BMI : $hasilL",
                  style: new TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Text(
                      "$teks",
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
