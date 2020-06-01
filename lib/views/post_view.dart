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
  final commentController = TextEditingController();
  final int like = 0;

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
                        height: 45,
                        width: 200,
                        hint: 'Write Something',
                        tap: () async {
                          nav.navto(CreatePostView);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: model.view != null
                      ? Expanded(
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
                                  onPressed: () {
                                    model.like(like, index);
                                  },
                                  icon: FaIcon(FontAwesomeIcons.heart),
                                  label:
                                      Text(model.view[index].like.toString())),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CPost(
                                  height: 45,
                                  width: 120,
                                  hint: 'Comment',
                                  tap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                            height: 300,
                                            child: model.view[index].comment !=
                                                    null
                                                ? Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child:
                                                          ListView.builder(
                                                              itemCount: model
                                                                  .view
                                                                  .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      ListTile(
                                                                        leading:
                                                                            CircleAvatar(
                                                                          backgroundColor: Colors.grey[500],
                                                                        ),
                                                                        title:
                                                                            Text('Na this same person'),
                                                                        subtitle:
                                                                            Text(model.view[index].comment == null ? "" : model.view[index].comment),
                                                                      )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 3.0,
                                                              horizontal:
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          CPost(
                                                            height: 46,
                                                            width: 300,
                                                            hint:
                                                                'Write Comment',
                                                            title:
                                                                commentController,
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                                Icons.send),
                                                            onPressed: () {
                                                              model.comment(
                                                                  commentController
                                                                      .text,
                                                                  index);

                                                              commentController.clear();
                                                            },
                                                            iconSize: 30,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                                : Container(
                                                    height: 300,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 120.0),
                                                          child: Text(
                                                              'No comments :('),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 3.0,
                                                                  horizontal:
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              CPost(
                                                                height: 46,
                                                                width: 300,
                                                                hint:
                                                                    'Write Comment',
                                                                title:
                                                                    commentController,
                                                              ),
                                                              IconButton(
                                                                icon: Icon(
                                                                    Icons.send),
                                                                onPressed: () {
                                                                  model.comment(
                                                                      commentController
                                                                          .text,
                                                                      index);

                                                                  commentController.clear();
                                                                },
                                                                iconSize: 30,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )));
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: Center(
                              child: Text('No posts yet :)'),
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
