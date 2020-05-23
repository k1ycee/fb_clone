import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  
  final Text text;
  final Function onPressed;
  final Color color;
  final bool busy;

  const Button({Key key,@required this.text,@required this.onPressed, this.color, this.busy = false}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: 50,
          width: 150,
          child: Center(child: widget.text),
          decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}