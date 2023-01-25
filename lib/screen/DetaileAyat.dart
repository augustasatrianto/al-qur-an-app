import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:coba_flutter/model/Ayat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetaileAyat extends StatefulWidget {
  final ar;
  final id;
  final nomor;
  final ter;

  DetaileAyat(
      {Key? key,
      required this.ar,
      required this.id,
      required this.nomor,
      required this.ter})
      : super(key: key);

  @override
  _DetaileAyatState createState() => _DetaileAyatState();
}

class _DetaileAyatState extends State<DetaileAyat> {
  ArabicNumbers arabicNumber = ArabicNumbers();
  List<Ayat> _list = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    final String url = "https://api.npoint.io/99c279bb173a6e28359c/surat/";
    final response = await http.get(Uri.parse(url + widget.nomor));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (var i in data) {
          _list.add(Ayat.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF45adb2),
          centerTitle: true,
          title: Text(
            "Surah " + widget.ar,
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
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20,
                        top: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.ar}',
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF45adb2),
                              ),
                            ),
                            Text(
                              '${widget.ter}',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF45adb2),
                              ),
                            ),
                          ],
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
                    : ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              Container(
                                color: (index % 2 != 1)
                                    ? Colors.white
                                    : Colors.grey[150],
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    right: 16,
                                    bottom: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 15),
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
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              child: Text(
                                                "${_list[index].ar}",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Text(
                                                "${_list[index].id}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF00695C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ))
          ],
        ));
  }
}
