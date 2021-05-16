// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:flash_chat/constants.dart';
class LandingPage extends StatefulWidget {
  static String id = 'landingPage';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    printUser();
  }

  void printUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        User loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(_auth.currentUser.toString()),
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
      ),
    );
  }
}
