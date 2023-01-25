import 'dart:async';
import 'package:coba_flutter/main_screen.dart';
import 'package:flutter/material.dart';
// import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    startApp(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Al-Quran App",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.92),
            child: Text(
              "Development By Reza Kurnia Setiawan",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.85),
            // child: JumpingDotsProgressIndicator(
            //   fontSize: 32,
            //   color: Colors.white,
            // ),
          )
        ],
      ),
    );
  }

  startApp(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return MainScreen();
      }));
    });
  }
}
