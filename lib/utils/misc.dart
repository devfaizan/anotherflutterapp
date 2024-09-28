import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color(0xFF5145C1);
const Color colorGrey = Colors.grey;
const Color colorBlack = Colors.black;
const Color colorAmber = Colors.amber;
const Color colorRed = Colors.red;

const Color colorBlueLight = Color(0xFFA6C9D1);
const Color colorBlueMedium = Color(0xFF83A5B1);
const Color colorBlueDark = Color(0xFF617F8F);
const Color colorGreyLight = Color(0xFFCED5DB);
const Color colorGreyMedium = Color(0xFFA1AEB9);

const String fontFamily = 'Montserrat';

showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
