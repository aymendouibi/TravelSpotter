
// @dart=2.9

import 'package:flutter/material.dart';

class MyTextSpan extends StatelessWidget {
  String text1,text2;
  MyTextSpan({this.text1,this.text2});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
             
              children: <InlineSpan>[
                TextSpan(
                  text: '$text1: ',
                  style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:text2,
                  style: const TextStyle(fontSize: 14),
                ),
              ]
            ));
  }
}