import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB0ViLKppF3sR8Yy51Sa0ZL3rhAP_p1zxg",
            authDomain: "socialflow-f4c9a.firebaseapp.com",
            projectId: "socialflow-f4c9a",
            storageBucket: "socialflow-f4c9a.firebasestorage.app",
            messagingSenderId: "1079609668557",
            appId: "1:1079609668557:web:6401444551b8f21adf8a84",
            measurementId: "G-BQFG4RY5J6"));
  } else {
    await Firebase.initializeApp();
  }
}
