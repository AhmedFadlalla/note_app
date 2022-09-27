import '../../domain/entities/base_user_data.dart';

class UserDataModel extends BaseUserData {
  UserDataModel({required super.userName,
    required super.password,
    required super.email,
    required super.image,
    required super.interstedId,
    required super.userId});


  factory UserDataModel.fromJson(Map<String, dynamic>json){
    return UserDataModel(userName: json["username"],
        password: json["password"],
        email: json["email"],
        image: json["imageAsBase64"]??"",
        interstedId: json["intrestId"],
        userId: json["id"],);
  }
}
