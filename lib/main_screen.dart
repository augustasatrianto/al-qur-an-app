// import 'package:alquran_app/Screen/Account.dart';
// import 'package:alquran_app/Screen/jadwalsholat.dart';
// import 'package:alquran_app/Screen/read_alquran.dart';
// import 'package:alquran_app/main.dart';
import 'package:coba_flutter/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<Widget> _children = [
    Homepage(
      username: "Augusta Satrianto",
    ),
    Homepage(
      username: "Augusta Satrianto",
    ),
    Homepage(
      username: "Augusta Satrianto",
    ),
    // JadwalSholat(),
    // ReadAlquran(),
    // Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[selectedIndex],
    );
  }
}
