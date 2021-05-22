import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final myController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var title;
  String body = '';
  int backgroundcolor = 0;
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

  void getMessages() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //messageText=(title+body) + user
          _firestore.collection('users').add({
            'user': loggedInUser.email,
            'title': title,
            'body': body,
            'bg': backgroundcolor
          });
          getMessages();
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
        // title: Text(_auth.currentUser.toString()),
        leading: null,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.done,
                // keyboardType: TextInputType.text,
                maxLines: 1,
                onChanged: (value) => {title = value},
                decoration: InputDecoration(
                  hintText: 'Task Title',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.newline,
                // keyboardType: TextInputType.text,
                onChanged: (value) {
                  body = value;
                },
                maxLines: 10,
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Task Details',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          Center(child: Text('Select background color:')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180.0),
                    ))),
                onPressed: () {
                  backgroundcolor = 1;
                },
                child: Text('Blue'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180.0),
                    ))),
                onPressed: () {
                  backgroundcolor = 2;
                },
                child: Text('Red'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreenAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180.0),
                    ))),
                onPressed: () {
                  backgroundcolor = 3;
                },
                child: Text('Green'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180.0),
                    ))),
                onPressed: () {
                  backgroundcolor = 4;
                },
                child: Text('Orange'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
