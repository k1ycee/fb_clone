import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/create_post_view_model.dart';
import 'package:fb_clone/widgets/create_post_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CreatePost extends StatelessWidget {

  final postController = TextEditingController();
  final Navigation nav = locator<Navigation>();
  
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreatePostViewModel>.withConsumer( 
    viewModelBuilder: () => CreatePostViewModel(),
    builder: (context, model, child) => SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[ 
                    GestureDetector(onTap: ()async{await nav.navto(PostView);},child: Container(height: 40, width: 40, child: Center(child: Icon(Icons.undo, color: Colors.white,),), decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue,))),
                    IconButton(icon: FaIcon(FontAwesomeIcons.paperPlane) , onPressed: (){model.aPost(postbody: postController.text);},iconSize: 30, color: Colors.grey[400],)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListTile(
                  leading:CircleAvatar(backgroundColor: Colors.red,),
                  title: WritePost(option: 'Write Something',post: postController),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(icon: FaIcon(FontAwesomeIcons.camera), onPressed: (){model.selectImage();}, iconSize: 32, color: Colors.grey[400],)
                ],),
              ) ,
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: model.selectedImg == null ? Container(height: 290, width: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey[100])):
                Container(height: 290, width: 200,child: Image.file(model.selectedImg,),)
              )
            ],
          ),
        )
      )
    ),
    );
  }
}