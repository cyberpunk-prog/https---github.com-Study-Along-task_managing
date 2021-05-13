import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setting up the theme
      //theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Task App')),
        ),
      ),
    );
  }
}
