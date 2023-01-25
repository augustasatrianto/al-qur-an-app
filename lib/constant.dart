import 'package:flutter/material.dart';

InkWell feature(double width, String image, String title, double ml, double mr,
    Function onTap) {
  return InkWell(
    onTap: () => onTap(),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 2,
              offset: Offset(0.5, 0.5),
            ),
          ],
          color: Colors.white),
      margin: EdgeInsets.only(left: ml, right: mr),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 70,
            color: Color(0xFF45adb2),
          ),
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF45adb2), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}
