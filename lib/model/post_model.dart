class Post{
  final String userId;
  final String postTitle;
  final String postImg;
  final String comment;
  final int like;

  Post({this.userId, this.postTitle, this.postImg, this.comment, this.like});


  Post.fromJson(Map<String, dynamic> data)
    : userId = data["userId"],
      postTitle = data["postTitle"],
      postImg = data["postImg"],
      comment = data["comment"],
      like = data["like"];

  Map<String, dynamic> toJson(){
    return{
      'userId': userId,
      'postTitle': postTitle,
      'postImg': postImg,
      'comment': comment,
      'like': like
    };
  }
}