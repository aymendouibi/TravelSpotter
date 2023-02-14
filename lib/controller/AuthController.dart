// ignore: file_names
// ignore_for_file: prefer_const_constructors
// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:locatio/view/home.dart';


import '../const/firebase.dart';
import '../view/auth/MyRegister.dart';




class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> firebaseUser;



  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance. 
    // Since we have to use that many times I just made a constant file and declared there
    
    firebaseUser = Rx<User>(auth.currentUser);

      
      
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    

  }

  _setInitialScreen(User user) {
    if (user == null) {
        
      // if the user is not found then the user is navigated to the MyRegister Screen
      Get.offAll(() => MyRegister());
        
    } else {
        
      // if the user exists and logged in the the user is navigated to the Home Screen
      // ignore: prefer_const_constructors
      Get.offAll(() => SafeArea(child: MyHome()));
        
    }
  }

  



  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);  
          FirebaseFirestore.instance
            .collection('user')
            .doc(auth.currentUser.uid)
            .set({
         
          'email': email,
          'password': password,
          'id': auth.currentUser.uid,
          'image':"https://www.kindpng.com/picc/m/451-4517876_default-profile-hd-png-download.png",
          
          
        
          
        });    
    } catch (e) {
      Get.snackbar(e.toString(),"");
      print(e.toString());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(e.toString(),"");
      print(e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}