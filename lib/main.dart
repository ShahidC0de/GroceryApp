import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_store/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializing firebase into the project before we go ahead;
  // it requires some sort of APIs, and these are necessary for initializing;
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDMeh6_6nZEq8GWMnYh4rn9bfu0zACUzNs",
      appId: "1:523401845152:android:8d209e3080b5f1017e2cc5",
      messagingSenderId: "523401845152",
      projectId: "grocerystore-c6292",
    ),
  );
  // MyApp() is a root of this application where the application starts....
  runApp(const MyApp());
}
