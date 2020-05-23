import 'package:fb_clone/widgets/create_post_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {

  final postController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[ 
                    GestureDetector(onTap: (){print('Undid');},child: Container(height: 40, width: 40, child: Center(child: Icon(Icons.undo, color: Colors.white,),), decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue,))),
                    IconButton(icon: FaIcon(FontAwesomeIcons.paperPlane) , onPressed: (){print('Sent');},iconSize: 30, color: Colors.grey[400],)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[ 
                  CircleAvatar(backgroundColor: Colors.red,),
                  WritePost(option: 'Write Something',post: postController)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(icon: FaIcon(FontAwesomeIcons.camera), onPressed: (){print('Chime');}, iconSize: 32, color: Colors.grey[400],)
                ],),
              )
            ],
          ),
        )
      )
    );
  }
}