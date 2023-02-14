// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatio/const/firebase.dart';
import 'package:locatio/const/iconDrawer.dart';
import 'package:locatio/view/admin/Admin.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 231, 4, 4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: Get.height * 0.14,
                    width: Get.height * 0.14,
                    child: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg'),
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SettingMenu(
            color: Colors.red,
            icon: Icons.favorite,
            text: 'mes favorites',
            function: () {},
          ),
          SettingMenu(
            color: Colors.green,
            icon: Icons.call,
            text: 'contacter nous',
            function: () {},
          ),
          SettingMenu(
            color: Colors.purple,
            icon: Icons.add,
            text: 'ajouter votre agence',
            function: () {
              Get.to(
                const MyAdmin(),
              );
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.red,
            ),
            title: const Text(
              "Se Deconnecter",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Get.defaultDialog(
                  title: "Confirm",
                  content: ElevatedButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      child: const Text('Se Deconnecter')));
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
