import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class DoaSeharihari extends StatefulWidget {
  const DoaSeharihari({Key? key}) : super(key: key);

  @override
  _DoaSeharihariState createState() => _DoaSeharihariState();
}

class _DoaSeharihariState extends State<DoaSeharihari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF45adb2),
          centerTitle: true,
          title: Text(
            "Doa Sehari-Hari",
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
                      image: AssetImage('assets/images/berdoa_header.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        top: 40,
                        child: Text(
                          'Doa\nSehari-hari',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF45adb2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("jsonfiles/doadoa.json"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var showData = json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: showData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              color: Color(0xFF45adb2),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8, bottom: 15),
                                            child: Text(
                                              showData[index]['judul'],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8, bottom: 15),
                                            child: Text(
                                              showData[index]['arab'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              showData[index]['arti'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    }))
          ],
        ));
  }
}
