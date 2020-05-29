import 'package:flutter/material.dart';

class CPost extends StatefulWidget {
  final TextEditingController word;
  final Function tapped;
  final String opt;

  const CPost({Key key, this.word, this.tapped, this.opt}) : super(key: key);

  @override
  _CPostState createState() => _CPostState();
}

class _CPostState extends State<CPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 10.0),
      child: Container(
        height: 45,
        width: 270,
        child: TextField(
          onTap: widget.tapped,
          textAlign: TextAlign.justify,
          autocorrect: true,
          controller: widget.word,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]),
                  borderRadius: BorderRadius.circular(30)),
              labelText: widget.opt,
              labelStyle: TextStyle(color: Colors.grey[300])),
        ),
      ),
    );
  }
}
