class Poster{
  final String userId;
  final String article;
  final String articleImgurl;
  final String articleImgName;

  Poster({this.article, this.articleImgurl, this.articleImgName, this.userId});



  Poster.fromdata(Map<String, dynamic> data) 
    : article = data["article"],
      articleImgurl = data["articleImgUrl"],
      articleImgName = data["articleImgName"],
      userId = data["userId"];


  Map<String, dynamic> toJson(){
    return{
      'article': article,
      'articleImgUrl': articleImgurl,
      'articleImgName': articleImgName,
      'userId': userId
    };
  }
}