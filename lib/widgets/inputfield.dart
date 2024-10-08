import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/misc.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.preIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData preIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        controller: controller,
        style: const TextStyle(
          color: colorWhite,
          fontFamily: 'Montserrat',
        ),
        textAlign: TextAlign.center,
        cursorColor: colorWhite,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            preIcon,
            color: colorWhite,
            size: 25.0,
          ),
          focusColor: colorWhite,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: colorGrey,
            fontSize: 12.0,
            fontFamily: 'Montserrat',
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorWhite,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: colorWhite,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 12.0,
          ),
        ),
      ),
    );
  }
}
