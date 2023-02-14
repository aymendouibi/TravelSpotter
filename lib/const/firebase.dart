import 'package:firebase_auth/firebase_auth.dart';

import '../controller/AuthController.dart';

AuthController authController = AuthController.instance;
//final Future<FirebaseApp> //firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;