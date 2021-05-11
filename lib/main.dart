import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
          elevation: 10,
        ),
        body: Row(
          children: [
            Container(
              color: Colors.red,
              width: 100,
            ),
            Container(
              color: Colors.yellow,
              width: 100,
            ),
            Container(
              color: Colors.green,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
