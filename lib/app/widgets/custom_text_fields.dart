import 'package:flutter/material.dart';
import 'dart:ui';

class CustomTextFields extends StatelessWidget {
  final bool obscureText;
  final TextInputType keyboardType;
  final String textPlaceHolder;
  final IconData textIcon;
  final TextEditingController controller;
  final Function(String) onChanged;

  CustomTextFields(
      {Key key,
      this.textPlaceHolder,
      this.textIcon,
      this.obscureText = false,
      this.keyboardType,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: textPlaceHolder,
        isDense: true,
        //contentPadding: EdgeInsets.all(0),
        icon: Icon(textIcon),
        hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: 'Berlin',
        ),
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
