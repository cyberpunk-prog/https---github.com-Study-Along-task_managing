import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/screens/landingPage.dart';
import 'package:taskmanger/screens/login.dart';
import 'package:taskmanger/screens/register.dart';
import 'package:taskmanger/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //setting up the theme
      //theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LandingPage.id: (context) => LandingPage(),
      },
    );
  }
}
