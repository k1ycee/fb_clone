class Poster{
  final String userId;
  final String article;
  final String articleImgurl;
  final String articleImgName;
  final String comment;
  final int like;

  Poster({this.article, this.articleImgurl, this.articleImgName, this.userId, this.comment, this.like});



  Poster.fromdata(Map<String, dynamic> data) 
    : article = data["article"],
      articleImgurl = data["articleImgUrl"],
      articleImgName = data["articleImgName"],
      comment = data["comment"],
      like = data["like"],
      userId = data["userId"];


  Map<String, dynamic> toJson(){
    return{
      'article': article,
      'articleImgUrl': articleImgurl,
      'articleImgName': articleImgName,
      'userId': userId,
      'like': like,
      'comment': comment
    };
  }
}