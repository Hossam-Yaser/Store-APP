import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  String hintText;
  bool obscureText;
  Function(String)? onChanged;
  TextInputType? inputType;

  CustomTextfield({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff24786D)),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
