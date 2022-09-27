import 'package:equatable/equatable.dart';

class BaseUserData extends Equatable{
  final String userName;
  final String password;
  final String email;
  final String image;
  final String interstedId;
  final String userId;


  BaseUserData({
   required  this.userName,
  required  this.password,
   required this.email,
  required  this.image,
  required  this.interstedId,
  required  this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}