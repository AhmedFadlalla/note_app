import 'package:equatable/equatable.dart';



class NoteParameter extends Equatable {
 final String id;
 String? text;
 String? dateTime;
 String? userId;

 NoteParameter({
    required this.id,
   this.text,this.dateTime,this.userId
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id,];
}
class UserParameter extends Equatable {
  final String userName;
  final String password;
  final String email;
   String? image;
  final String interstedId;



  UserParameter({
    required  this.userName,
    required  this.password,
    required this.email,
      this.image,
    required  this.interstedId,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [userName,password,email,image,interstedId];
}
String? uId;

