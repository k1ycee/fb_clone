
class User{
  final String userId;


  User({this.userId});


  User.fromJson(Map<String, dynamic> data)
    : userId = data["userId"];

  Map<String, dynamic> toJson(){
    return{
      'userId': userId,
    };
  }
}