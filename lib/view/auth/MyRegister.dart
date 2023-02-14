import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatio/view/auth/MyLogin.dart';

import '../../const/firebase.dart';
import '../../const/textfield.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _RegisterState();
}

class _RegisterState extends State<MyRegister> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
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
                    height: 19,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Counfirmez le Mot de Passe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MyTextField(
                    controller: _passwordController1,
                    hint: '*******',
                    obscure: true,
                  ),
                 const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_passwordController.text ==
                              _passwordController1.text) {
                            authController.register(_emailController.text.trim(),
                                _passwordController.text.trim());
                          } else {
                            Get.snackbar("mot de passe incorrect", "");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 0, 0, 0),
                            minimumSize: const Size.fromHeight(50),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            )),
                        child: const Text("Cree un Compte")),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: InkWell(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'Deja un compte? ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 211, 211, 211),
                                  fontSize: 16,
                                )),
                            TextSpan(
                                text: 'Se Connecter',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.offAll(MyLogin());
                      },
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
