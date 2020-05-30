import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/post_view_model.dart';
import 'package:fb_clone/widgets/create_post_textfield_widget.dart';
import 'package:fb_clone/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Posts extends StatelessWidget {
  final Navigation nav = locator<Navigation>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PostViewModel>.withConsumer(
      viewModelBuilder: () => PostViewModel(),
      onModelReady: (model) => model.getposts(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(
            builder: (context) => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Facebook',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[800]),
                        child: Center(
                          child: Text(
                            'Clone mode',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 23,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CPost(
                        height: 35,
                        width: 200,
                        hint: 'Write Something',
                        tap: () async {
                          nav.navto(CreatePostView);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.view.length,
                    itemBuilder: (context, index) => Posted(
                      height: 550,
                      width: 400,
                      name: Text('Afa Mmadu'),
                      time: Text('10:00 AM'),
                      alltext: Text(
                        model.view[index].postTitle,
                      ),
                      leading: FlatButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.heart),
                          label: Text('0')),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CPost(
                          height: 20,
                          width: 120,
                          hint: 'Comment',
                          tap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                    margin: EdgeInsets.all(20),
                                    height: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )),
                                    child: model.view[index].comment != null
                                        ? ListView.builder(
                                            itemCount: model.view.length,
                                            itemBuilder: (context, index) =>
                                                ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey[500],
                                                  ),
                                                  title: Text(
                                                      'Na this same person'),
                                                  subtitle: Text(model
                                                      .view[index].comment),
                                                ))
                                        : Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            )),
                                            height: 250,
                                            child: Center(
                                              child: Text('No comments :('),
                                            ),
                                          )));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
