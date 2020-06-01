class Post{
  final String userId;
  final String postTitle;
  final String postImg;
  final String comment;
  final int like;
  final String documentId;

  Post({this.userId, this.postTitle, this.postImg, this.comment, this.like = 0, this.documentId});


  Post.fromJson(Map<String, dynamic> data, String documentId)
    : userId = data["userId"],
      postTitle = data["postTitle"],
      postImg = data["postImg"],
      comment = data["comment"],
      documentId = documentId,
      like = data["like"];

  Map<String, dynamic> toJson(){
    return{
      'userId': userId,
      'postTitle': postTitle,
      'postImg': postImg,
      'comment': comment,
      'like': like,
    };
  }
}