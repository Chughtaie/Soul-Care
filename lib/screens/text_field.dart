import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String str) onChange;
  final String hintText;
  final bool obscure;
  final controller;

  CustomTextField(
      {this.onChange, this.hintText, this.obscure, this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12.0),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white),
          onChanged: onChange,
          decoration: InputDecoration(
            //hintStyle: kRobotoRegularTextStyle,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hintText,
            //focusColor: Colors.orange,
          ),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
