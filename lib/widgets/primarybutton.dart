import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/misc.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backcolor = colorWhite,
    this.textcolor = colorBlack,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backcolor;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            color: backcolor,
            borderRadius: BorderRadius.circular(30),
          ),
          constraints: const BoxConstraints(
            maxHeight: 60,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
