import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/custom/roundedButton.dart';
import 'package:taskmanger/custom/widelayout.dart';
import 'package:taskmanger/screens/login.dart';
import 'package:taskmanger/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomePage';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 700) {
              return WideLayout();
            } else
              return NarrowLayout();
          },
        ),
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'welcomeImage',
                child: Container(
                  child: Image.asset('images/image3.png'),
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //width: 250.0,
                child: TextLiquidFill(
                  text: 'TASK MANAGER',
                  waveColor: Colors.black,
                  boxBackgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 100.0,
                ),
              )
            ],
          ),
        ),
        RoundedButton(
          color: Colors.blue,
          onPressedButton: () => Navigator.pushNamed(context, LoginScreen.id),
          text: 'Sign In',
        ),
        RoundedButton(
          color: Colors.indigo,
          onPressedButton: () =>
              Navigator.pushNamed(context, RegistrationScreen.id),
          text: 'Sign Up',
        ),
      ],
    );
  }
}
