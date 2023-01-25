import 'dart:ui';
import 'package:coba_flutter/constant.dart';
import 'package:coba_flutter/screen/asmaulhusna.dart';
import 'package:coba_flutter/screen/doa_doa.dart';
import 'package:coba_flutter/screen/jadwal_sholat.dart';
import 'package:coba_flutter/screen/read_alquran.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  Homepage({required this.username});
  final String username;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFf3fcfd),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              height: 170,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/up_header.png'))),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 20,
                    top: 44,
                    child: Text(
                      'My AL-QURAN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 80,
                    child: Text(
                      "Pelajari Al-Qur'an\nsetiap hari\ndan baca\nsekali setiap hari",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    feature(
                        mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/quran_read.png',
                        "Baca Al-Quran",
                        15,
                        0, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReadAlquran()));
                    }),
                    feature(mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/waktu.png', "Jadwal Sholat", 0, 15, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JadwalSholat()));
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    feature(
                        mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/books.png',
                        "Doa Sehari-hari",
                        15,
                        0, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoaSeharihari()));
                    }),
                    feature(
                        mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/asmaulhusna.png',
                        "Asmaul Husna",
                        0,
                        15, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AsmaulHusna()));
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    feature(
                        mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/Majalah.png',
                        "Majalah Islam",
                        15,
                        0, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoaSeharihari()));
                    }),
                    feature(mediaQueryWidth / 2 - 15 - 10,
                        'assets/images/Kabah.png', "Kiblat", 0, 15, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AsmaulHusna()));
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
