import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {

  final TextEditingController controller;
  final String text;
  final bool password;

  const AuthField({Key key, this.controller, this.text, this.password = false}) : super(key: key);



  @override
  _AuthFieldState createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {

  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 145,
      child: TextField(
        obscureText: widget.password,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyle(color: Colors.grey[400])
        ),
      )
    );
  }
}