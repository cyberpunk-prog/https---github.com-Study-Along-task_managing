import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/custom/roundedButton.dart';
import 'package:taskmanger/screens/login.dart';
import 'package:taskmanger/screens/register.dart';

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 'welcomeImage',
              child: Container(
                child: Image.asset('images/image3.png'),
                height: MediaQuery.of(context).size.height / 1,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            //color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  //width: 250.0,
                  child: TextLiquidFill(
                      text: 'TASK MANAGER',
                      waveColor: Colors.white,
                      boxBackgroundColor: Colors.indigo,
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 16,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: MediaQuery.of(context).size.height / 3,
                      boxWidth: MediaQuery.of(context).size.width / 2),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                RoundedButton(
                  color: Colors.blue,
                  onPressedButton: () =>
                      Navigator.pushNamed(context, LoginScreen.id),
                  text: 'Sign In',
                ),
                RoundedButton(
                  color: Colors.indigo,
                  onPressedButton: () =>
                      Navigator.pushNamed(context, RegistrationScreen.id),
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
