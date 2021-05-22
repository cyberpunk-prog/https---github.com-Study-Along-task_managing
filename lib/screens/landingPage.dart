import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanger/screens/createTask.dart';

class LandingPage extends StatefulWidget {
  static String id = 'landingPage';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    printUser();
  }

  late User loggedInUser;
  void printUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // void getMessages() async {
  //   await for (var snapshot in _firestore.collection('users').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }
  List<Color> bgcolor = [
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.green,
    Colors.orange
  ];
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTask()),
          );
        },
        child: Icon(Icons.edit),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          var messageTitle, messageBody, messageUser, messagebg;
          List<Widget> messageWidgets = [];
          if (snapshot.hasData) {
            final messages = snapshot.data!.docs.reversed;

            for (var message in messages) {
              messageTitle = message.get('title');
              messageBody = message.get('body');
              messageUser = message.get('user');
              messagebg = message.get('bg');
              // final messageWidget = Text(
              //     'title: $messageTitle, body: $messageBody by-$messageUser ');
              if (loggedInUser.email == messageUser)
                messageWidgets.add(
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: bgcolor[messagebg]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                              child: Text(
                            messageTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(messageBody)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('- $messageUser'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
            }
          } else {
            return CircularProgressIndicator();
          }

          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 500 && constraints.maxWidth < 1000) {
                return GridView.count(
                  children: messageWidgets,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  crossAxisCount: 2,
                );
              } else if (constraints.maxWidth > 1000) {
                return GridView.count(
                  children: messageWidgets,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  crossAxisCount: 3,
                );
              } else {
                return GridView.count(
                  children: messageWidgets,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  crossAxisCount: 1,
                );
              }
            },
          );
        },
      ),
    );
  }
}
