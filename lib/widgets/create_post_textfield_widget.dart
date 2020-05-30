import 'package:flutter/material.dart';

class CPost extends StatefulWidget {

  final TextEditingController title;
  final String hint;
  final Function tap;
  final double height;
  final double width;
  final int maxlines;

  const CPost({Key key, this.title, this.hint, this.tap, this.height, this.width, this.maxlines}) : super(key: key);
  


  @override
  _CPostState createState() => _CPostState();
}

class _CPostState extends State<CPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      child: TextField(
        maxLines: widget.maxlines,
        controller: widget.title,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          hintText: widget.hint
        ),
        onTap: widget.tap,
      ),
    );
  }
}