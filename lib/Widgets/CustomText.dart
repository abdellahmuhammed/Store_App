import 'package:flutter/material.dart';

Widget buildText({
  required String text ,
  double fontSize = 25,
  FontWeight  fontWeight = FontWeight.bold,
  Color color = Colors.black


}) {
  return Text(
    text,
    style:  TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
    ),
  );
}