import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {@required this.onChanged, this.hintText, required this.obsecure});
  final onChanged;
  final hintText;
  final obsecure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
