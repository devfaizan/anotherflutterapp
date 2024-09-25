import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color(0xFF5145C1);
const Color colorGrey = Colors.grey;
const Color colorBlack = Colors.black;
const Color colorAmber = Colors.amber;
const Color colorRed = Colors.red;

const String fontFamily = 'Montserrat';

showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
