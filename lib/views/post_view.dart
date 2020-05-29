import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/viewer_view_model.dart';
import 'package:fb_clone/widgets/comment_text_field_widget.dart';
import 'package:fb_clone/widgets/posted_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Posts extends StatelessWidget {

  
  final Navigation nav = locator<Navigation>();
  final persyarn = TextEditingController();
  final postController = TextEditingController();
  final int like = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ViewerViewModel>.withConsumer( 
      viewModelBuilder: () => ViewerViewModel(),
      onModelReady: (model) => model.getposts(),
      builder: (context,model, _) => SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    tapped: ()async{nav.navto(CreatePostView);},
                    word: postController,
                    opt: 'Write Something',
                  )
                ),
              ],
              ),
            ),
             Expanded(
                  child: model.view != null ?  
                  ListView.builder(
                    itemCount: model.view.length,
                    itemBuilder: (context, index) => Posted(alltext: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(model.view[index].article,),
                    ), name: Text('Afa'), time: Text('10:00AM'), child: CPost(opt: 'Comment',
                    tapped: (){
                          showModalBottomSheet(
                          context: context, 
                          builder: (context) => Center()
                      );
                    }, word: persyarn), leading: FlatButton.icon(icon: FaIcon(FontAwesomeIcons.heart), onPressed: (){model.like(like); print('liked');}, label: Text(model.view[index].like.toString()),),),
                  ) : Center(child: Text('There are no posts now :('))
                )
           ],
          )
        ),
      ),
    ),
    );
  }
}