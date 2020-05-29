class Viewer{
  final String post;
  final String imgName;
  final String imgUrl;
  final String comment;
  final int like;

  Viewer({this.post, this.imgName, this.imgUrl, this.comment, this.like});

  Viewer.fromJson(Map<String, dynamic> data)
    : post = data["post"],
      imgName = data["imgName"],
      imgUrl = data["imgUrl"],
      comment = data["comment"],
      like = data["like"];


  Map<String, dynamic> toJson(){
    return{
      'comment': comment,
      'like': like
    };
  }
}