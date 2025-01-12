import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBsl5_9KwOK9fe_STC1PGIBdkPTIw20Z60",
            authDomain: "intelli-chat-rxghxn.firebaseapp.com",
            projectId: "intelli-chat-rxghxn",
            storageBucket: "intelli-chat-rxghxn.firebasestorage.app",
            messagingSenderId: "391943173394",
            appId: "1:391943173394:web:c8f21530b996558155afcb"));
  } else {
    await Firebase.initializeApp();
  }
}
