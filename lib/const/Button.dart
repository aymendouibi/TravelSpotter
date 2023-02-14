// @dart=2.9

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  Function function;
  
  MyButton({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
            child: ElevatedButton(onPressed: function,style:ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 0, 0),
               minimumSize: const Size.fromHeight(50),
                textStyle:
                    const TextStyle(fontSize: 20,)), child: Text(text)),
    );
  }
}