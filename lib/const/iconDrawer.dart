// @dart=2.9


import 'package:flutter/material.dart';

class SettingMenu extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  Function function;
   

  SettingMenu({ Key key,this.color,this.icon,this.text,this.function, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: SizedBox(
          height: 70,
          child: InkWell(
            onTap: function,
            child: Row(children: [
              CircleAvatar(backgroundColor: color.withOpacity(0.23),child: Icon(icon,color: color),),
              const SizedBox(width: 10,),
              Text(text),
      
            ],),
          ),
        ),
      ),
    );
  }
}