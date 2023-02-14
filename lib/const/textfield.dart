// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
// @dart=2.9

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  String hint;
  bool obscure;
  MyTextField({this.controller, this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
     
      decoration: InputDecoration(
          hintText: hint,
         
          hintStyle:
              TextStyle(color: Color.fromARGB(255, 58, 58, 58), ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
       
         focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
          
          fillColor: Color.fromARGB(255, 243, 243, 243)),
      controller: controller,
      obscureText: obscure,
    );
  }
}
