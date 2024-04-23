import 'package:flutter/material.dart';
import 'package:grocery_store/backend/firebase_auth.dart';
import 'package:grocery_store/backend/service_provider.dart';
import 'package:grocery_store/screens/authentication/login_page.dart';
import 'package:grocery_store/screens/home/home_screen.dart';
import 'package:grocery_store/styles/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      // putting serviceProvider extends ChangeNotifier responsible for getting state changes in app,
      // a modular approach;
      child: MaterialApp(
          theme: themeData,
          home: StreamBuilder(
              // reading a data in firebase where the user is already logged in or not;
              // if logged in then show homescreen else login screen;
              stream: FirebaseAuthHelper().getAuthChange,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const LoginScreen();
                }
              })
          //const LoginScreen(),
          ),
    );
  }
}
