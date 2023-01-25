import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JadwalSholat extends StatefulWidget {
  const JadwalSholat({Key? key}) : super(key: key);

  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  String idWilayah = "1638";
  String namaWilayah = "";
  List _list = [];
  List jadwal = [
    'IMSAK',
    'SUBUH',
    'TERBIT',
    'DHUHA',
    'DZUHUR',
    'ASHAR',
    'MAGHRIB',
    'ISYA'
  ];
  var loading = false;
  String lokasi = '';
  String daerah = '';
  String imsak = '';
  String subuh = '';
  String terbit = '';
  String dhuha = '';
  String dzuhur = '';
  String ashar = '';
  String maghrib = '';
  String isya = '';
  String date = '';

  Future _fetchData() async {
    setState(() {
      loading = true;
    });
    final String url =
        "https://api.myquran.com/v1/sholat/jadwal/${idWilayah}/2021/06/23";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      lokasi = data['data']['lokasi'];
      daerah = data['data']['daerah'];
      imsak = data['data']['jadwal']['imsak'];
      subuh = data['data']['jadwal']['subuh'];
      terbit = data['data']['jadwal']['terbit'];
      dhuha = data['data']['jadwal']['dhuha'];
      dzuhur = data['data']['jadwal']['dzuhur'];
      ashar = data['data']['jadwal']['ashar'];
      maghrib = data['data']['jadwal']['maghrib'];
      isya = data['data']['jadwal']['isya'];
      date = data['data']['jadwal']['date'];
      _list.add(imsak);
      _list.add(subuh);
      _list.add(terbit);
      _list.add(dhuha);
      _list.add(dzuhur);
      _list.add(ashar);
      _list.add(maghrib);
      _list.add(isya);
      setState(() {
        loading = false;
      });
    }
  }

  List<String> _listLokasi = [];

  Future _fetchDataLokasi() async {
    setState(() {
      loading = true;
    });

    final String urlLokasi = "https://api.myquran.com/v1/sholat/kota/semua";

    final response = await http.get(Uri.parse(urlLokasi));
    if (response.statusCode == 200) {
      setState(() {
        final dataLokasi = json.decode(response.body);
        int index = 0;
        for (var i in dataLokasi) {
          _listLokasi.add(dataLokasi[index]['lokasi']);

          index++;
        }
        print(_listLokasi);
        loading = false;
      });
    }
  }

  Future _updateLokasi() async {
    final String urlLokasi = "https://api.myquran.com/v1/sholat/kota/semua";

    final response = await http.get(Uri.parse(urlLokasi));
    if (response.statusCode == 200) {
      setState(() {
        final dataLokasi = json.decode(response.body);
        int index = 0;
        for (var i in dataLokasi) {
          if (dataLokasi[index]['lokasi'] == namaWilayah) {
            idWilayah = dataLokasi[index]['id'];
          }

          index++;
        }
      });
      _fetchData();
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    _fetchDataLokasi();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF45adb2),
          centerTitle: true,
          title: Text(
            "Jadwal Sholat",
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
                        image: AssetImage('assets/images/mosque_header.png'),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ],
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: const Color(0xFFedf1f7),
            //       borderRadius: BorderRadius.circular(5)),
            //   height: 40,
            //   child: RawAutocomplete(
            //     optionsBuilder: (TextEditingValue textEditingValue) {
            //       if (textEditingValue.text == '') {
            //         return const Iterable<String>.empty();
            //       } else {
            //         List<String> matches = <String>[];
            //         matches.addAll(_listLokasi);

            //         matches.retainWhere((s) {
            //           return s
            //               .toLowerCase()
            //               .contains(textEditingValue.text.toLowerCase());
            //         });
            //         return matches;
            //       }
            //     },
            //     onSelected: (String selection) {
            //       namaWilayah = selection;
            //       print('You just selected $selection');
            //     },
            //     fieldViewBuilder: (BuildContext context,
            //         TextEditingController textEditingController,
            //         FocusNode focusNode,
            //         VoidCallback onFieldSubmitted) {
            //       return Padding(
            //         padding: const EdgeInsets.only(left: 10.0, bottom: 3),
            //         child: TextField(
            //           style: GoogleFonts.notoSans(
            //               fontSize: 12,
            //               fontWeight: FontWeight.w400,
            //               color: Color(0xFF4D5569)),
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //             hintText: 'Masukkan nama pegawai',
            //             hintStyle: GoogleFonts.notoSans(
            //                 color: const Color(0xFFA6AAB4),
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w400),
            //           ),
            //           controller: textEditingController,
            //           focusNode: focusNode,
            //           onSubmitted: (String value) {},
            //         ),
            //       );
            //     },
            //     optionsViewBuilder: (BuildContext context,
            //         void Function(String) onSelected,
            //         Iterable<String> options) {
            //       return Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(top: 5),
            //             child: Material(
            //                 child: Column(
            //               children: [
            //                 Column(
            //                   children: [
            //                     Container(
            //                         padding: EdgeInsets.symmetric(
            //                             horizontal: 10, vertical: 14),
            //                         decoration: BoxDecoration(
            //                           color: Color(0xFFF7F9FC),
            //                           borderRadius: BorderRadius.circular(10),
            //                           boxShadow: const [
            //                             BoxShadow(
            //                               color:
            //                                   Color.fromARGB(60, 142, 142, 142),
            //                               blurRadius: 3.0,
            //                               offset: Offset(0.0, 3.0),
            //                             ),
            //                           ],
            //                         ),
            //                         margin: EdgeInsets.only(right: 48),
            //                         child: SingleChildScrollView(
            //                             child: Column(
            //                           children: options.map((opt) {
            //                             return InkWell(
            //                                 onTap: () {
            //                                   onSelected(opt);
            //                                 },
            //                                 child: Container(
            //                                     margin: EdgeInsets.symmetric(
            //                                         vertical: 5),
            //                                     child: Row(
            //                                       mainAxisAlignment:
            //                                           MainAxisAlignment.start,
            //                                       children: [
            //                                         Text(
            //                                           opt,
            //                                           style:
            //                                               GoogleFonts.notoSans(
            //                                                   fontSize: 12,
            //                                                   fontWeight:
            //                                                       FontWeight
            //                                                           .w400,
            //                                                   color: Color(
            //                                                       0xFF4D5569)),
            //                                         ),
            //                                       ],
            //                                     )));
            //                           }).toList(),
            //                         ))),
            //                   ],
            //                 ),
            //               ],
            //             )),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                child: Text(
                  "${lokasi}",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () {
                // setState(() {
                //   _list.clear();
                //   _updateLokasi();
                // });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    height: 0,
                    color: Color(0xFFBBC4CE),
                  );
                },
                padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: index == 0
                              ? BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))
                              : index == _list.length - 1
                                  ? BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : BorderRadius.circular(0),
                          boxShadow: [BoxShadow(color: Color(0xFF45adb2))],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${jadwal[index]}",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 50,
                              child: Text("${_list[index]}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
