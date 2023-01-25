import 'package:flutter/material.dart';
import 'dart:convert';

class AsmaulHusna extends StatefulWidget {
  const AsmaulHusna({Key? key}) : super(key: key);

  @override
  _AsmaulHusnaState createState() => _AsmaulHusnaState();
}

class _AsmaulHusnaState extends State<AsmaulHusna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF45adb2),
          centerTitle: true,
          title: Text(
            "Asmaul Husna",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mosque_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("jsonfiles/asmaulhusna.json"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var showData = json.decode(snapshot.data.toString());
                        return ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          padding: EdgeInsets.all(15),
                          itemCount: showData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 22),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF45adb2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            showData[index]['latin'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 16),
                                            width: 200,
                                            child: Text(
                                              showData[index]['arti'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        showData[index]['arab'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
