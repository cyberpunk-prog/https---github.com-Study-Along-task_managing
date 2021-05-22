// ignore: import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/custom/customTextField.dart';
import 'package:taskmanger/custom/roundedButton.dart';
import 'package:taskmanger/screens/landingPage.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registerPage';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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

  Future registerUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
      Navigator.pushNamed(context, LandingPage.id);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 1,
                  child: Hero(
                    tag: 'welcomeImage',
                    child: Container(
                      height: 150.0,
                      child: Image.asset('images/image4.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Container(
                  width: 1,
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFieldCustom(
                        obsecure: false,
                        onChanged: (value) {
                          email = value;
                        },
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
                        onChanged: (value) {
                          password = value;
                        },
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: RoundedButton(
                        color: Colors.indigo,
                        onPressedButton: () async {
                          showSpinner();
                          await registerUser();
                        },
                        text: 'Register',
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'welcomeImage',
                    child: Image.asset('images/image4.png'),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFieldCustom(
                    obsecure: false,
                    onChanged: (value) {
                      email = value;
                    },
                    hintText: 'Enter your Email',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFieldCustom(
                    obsecure: true,
                    onChanged: (value) {
                      password = value;
                    },
                    hintText: 'Enter your password',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    color: Colors.indigo,
                    onPressedButton: () async {
                      showSpinner();
                      await registerUser();
                    },
                    text: 'Register',
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
