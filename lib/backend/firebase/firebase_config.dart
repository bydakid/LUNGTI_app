import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqQa2izFaLU6DfmrJi2DAkFgrhbvyx1CQ",
            authDomain: "lungti-food.firebaseapp.com",
            projectId: "lungti-food",
            storageBucket: "lungti-food.appspot.com",
            messagingSenderId: "421711802858",
            appId: "1:421711802858:web:b627286aba40153d100293",
            measurementId: "G-E3475YMMWN"));
  } else {
    await Firebase.initializeApp();
  }
}
