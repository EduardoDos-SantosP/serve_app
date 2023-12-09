import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String labelText;
  Icon? prefixIcon;
  var suffixIcon;
  bool obscureText = false;
  TextEditingController controller;

  CustomTextField(
      {required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      required this.controller});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
