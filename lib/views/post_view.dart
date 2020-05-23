import 'package:fb_clone/widgets/comment_text_field_widget.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Facebook', style: TextStyle(color:Colors.blue[400], fontSize: 20, fontWeight: FontWeight.w800),),
                    Container(height: 30,width: 120, child: Center(child: Text('Clone Mode', style: TextStyle(color: Colors.white),),),decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey[850]),),
                    
                ],
            ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(backgroundColor: Colors.grey, radius: 20,),
                  SizedBox(width: 15,),
                  Container(
                  height: 45,
                  width: 260,
                  child: CPost(
                    tapped: (){},
                    word: commentController,
                    opt: 'Write Something',
                  )
                ),
              ],
              ),
            ),
           ],
          )
        ),
      ),
    );
  }
}