import 'package:flutter/material.dart';

class WritePost extends StatefulWidget {

  final TextEditingController post;
  final Function tap;
  final String option;

  const WritePost({Key key, this.post, this.tap, this.option}) : super(key: key);

  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 150,
        width: 250,
        child: TextField(
          maxLines: 100,
          controller: widget.post,
          onTap: widget.tap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide()
            ),
            hintText: widget.option,
            hintStyle: TextStyle(color: Colors.grey[300])
          ),
        ),     
      ),
    );
  }
}