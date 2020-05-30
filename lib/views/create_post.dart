import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/create_post_view_model.dart';
import 'package:fb_clone/widgets/create_post_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CreatePost extends StatelessWidget {

  final postController = TextEditingController();
  final Navigation nav = locator<Navigation>();


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreatePostViewModel>.withConsumer(
      viewModelBuilder: () => CreatePostViewModel(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()async{await nav.navto(PostView);},
                    child: Container(height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue), child: Icon(Icons.undo, color: Colors.white,),)),
                  IconButton(icon: FaIcon(FontAwesomeIcons.fighterJet, color: Colors.grey[400],), onPressed: (){model.post(postController.text);}, iconSize: 30,),
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.grey[300], radius: 23,),
              title: CPost(height: 300, width: 200,hint: 'Write Something', maxlines: 100, title: postController,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: FaIcon(FontAwesomeIcons.camera, color: Colors.grey[400],),onPressed: (){}, iconSize: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}