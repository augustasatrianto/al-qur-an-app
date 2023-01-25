// import 'package:alquran_app/Screen/DetaileAyat.dart';
import 'dart:ui';

import 'package:coba_flutter/model/surat.dart';
import 'package:coba_flutter/screen/DetaileAyat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:arabic_numbers/arabic_numbers.dart';

class ReadAlquran extends StatefulWidget {
  const ReadAlquran({Key? key}) : super(key: key);

  @override
  _ReadAlquranState createState() => _ReadAlquranState();
}

class _ReadAlquranState extends State<ReadAlquran> {
  ArabicNumbers arabicNumber = ArabicNumbers();

  List<SuratDetail> _list = [];
  var loading = false;
  Future _fetchData() async {
    setState(() {
      loading = true;
    });
    final String url =
        "https://al-quran-8d642.firebaseio.com/data.json?print=pretty";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (var i in data) {
          _list.add(SuratDetail.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF45adb2),
          centerTitle: true,
          title: Text(
            "Al-Qur'an",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mengaji_header.png'),
                        fit: BoxFit.fitHeight),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        top: 40,
                        child: Text(
                          "Baca\nAl-Qur'an",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF45adb2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              thickness: 1,
                              height: 0,
                              color: Color(0xFFBBC4CE),
                            ),
                          );
                        },
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetaileAyat(
                                    nomor: _list[index].nomor,
                                    ar: _list[index].nama,
                                    id: index,
                                    ter: _list[index].arti,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 76,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 24, top: 12, bottom: 12, right: 22),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF00695C),
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/bingkai_nomor.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "${arabicNumber.convert(index + 1)}",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "${_list[index].nama}",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "${_list[index].arti}",
                                                style: GoogleFonts.poppins(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${_list[index].asma}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF00695C)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ))
          ],
        ));
  }
}
