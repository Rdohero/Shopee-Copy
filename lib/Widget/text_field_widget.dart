import 'package:flutter/material.dart';

Widget myTextField(TextEditingController controller, String myLabel, bool obscure, TextInputType text,IconData iconData) {
  return Container(
    margin: const EdgeInsets.only(top: 5, right: 30, left: 30),
    child: TextField(
      style: const TextStyle(color: Colors.black),
      autofocus: false,
      controller: controller,
      obscureText: obscure,
      keyboardType: text,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: myLabel,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(iconData, color: Colors.grey),
      ),
    ),
  );
}