// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatio/view/admin/addOffer.dart';

class AdminPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   var data= Get.arguments;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Column(children:  [
Card(child:ListTile(title: const Text('ajouter nouvelle offre'),onTap: (){Get.to(AddService(),arguments: data);},))
      ]),
    );
  }
}