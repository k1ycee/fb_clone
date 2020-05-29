import 'package:fb_clone/widgets/comment_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Posted extends StatefulWidget {

  final Widget alltext;
  final Text name;
  final Text time;
  final Widget child;
  final Widget leading;

  const Posted({Key key, this.alltext, this.name, this.time, this.child,this.leading}) : super(key: key);


  @override
  _PostedState createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      child: Column(
        children: <Widget>[
          ListTile(leading: CircleAvatar(backgroundColor: Colors.greenAccent,), title: widget.name, subtitle: widget.time,),
        widget.alltext,
        Container(height: 320, width: 345,decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),),
        ListTile(leading: widget.leading , title: widget.child,)
      ],
      ),
    );
  }
}