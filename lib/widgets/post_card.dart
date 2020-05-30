import 'package:flutter/material.dart';

class Posted extends StatefulWidget {
  final Widget alltext;
  final Text name;
  final Text time;
  final Widget child;
  final Widget leading;
  final double height;
  final double width;

  const Posted(
      {Key key,
      this.alltext,
      this.name,
      this.time,
      this.child,
      this.leading,
      this.height,
      this.width})
      : super(key: key);

  @override
  _PostedState createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            title: widget.name,
            subtitle: widget.time,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: widget.alltext,
          ),
          Container(
            height: 320,
            width: 345,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10)),
          ),
          Expanded(
            child: ListTile(
              leading: widget.leading,
              title: widget.child,
            ),
          )
        ],
      ),
    );
  }
}
