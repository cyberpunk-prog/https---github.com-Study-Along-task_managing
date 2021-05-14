import 'package:flutter/material.dart';
import 'package:taskmanger/screens/landingPage.dart';
import 'package:taskmanger/screens/login.dart';
import 'package:taskmanger/screens/register.dart';
import 'package:taskmanger/screens/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setting up the theme
      //theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
