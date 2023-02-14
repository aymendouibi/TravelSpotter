
import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget  with PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(

      
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.red,
              size: 34,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: const Icon(
                Icons.search,
                color: Colors.red,
                size: 30,
              ),
            ),
          )
        ],
      );
      
  }
}