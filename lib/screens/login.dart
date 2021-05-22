import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/custom/customTextField.dart';
import 'package:taskmanger/custom/roundedButton.dart';
import 'package:taskmanger/screens/landingPage.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginPage';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  var email;
  var password;

  void showSpinner() {
    setState(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          });
    });
  }

  Future signInUser() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
      Navigator.pushNamed(context, LandingPage.id);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'welcomeImage',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/image2.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFieldCustom(
                          obsecure: false,
                          onChanged: (value) => {email = value},
                          hintText: 'Enter your Email',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFieldCustom(
                          obsecure: true,
                          onChanged: (value) => {password = value},
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: RoundedButton(
                          color: Colors.blue,
                          onPressedButton: () async {
                            showSpinner();
                            await signInUser();
                          },
                          text: 'Log In',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'welcomeImage',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/image2.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFieldCustom(
                    obsecure: false,
                    onChanged: (value) => {email = value},
                    hintText: 'Enter your Email',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFieldCustom(
                    obsecure: true,
                    onChanged: (value) => {password = value},
                    hintText: 'Enter your password',
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  RoundedButton(
                    color: Colors.blue,
                    onPressedButton: () async {
                      showSpinner();
                      await signInUser();
                    },
                    text: 'Log In',
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
