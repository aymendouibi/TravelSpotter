import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/firebase.dart';
import '../../const/textfield.dart';
import 'MyRegister.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      
      body:  SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/red.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    "Commencez\nVotre\nVoyage",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MyTextField(
                    controller: _emailController,
                    hint: "aymen@gmail.com",
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Mot de Passe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MyTextField(
                    controller: _passwordController,
                    hint: '*******',
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                        onPressed: () async {
                          authController.login(_emailController.text.trim(),
                              _passwordController.text.trim());
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 0, 0, 0),
                            minimumSize: const Size.fromHeight(50),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            )),
                        child: const Text("se Connecter")),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'nouveau? ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 211, 211, 211),
                                  fontSize: 16,
                                )),
                            TextSpan(
                                text: 'Cree un compte',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.offAll(MyRegister());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
