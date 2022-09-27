import 'package:equatable/equatable.dart';

abstract class BaseUserEvent extends Equatable{

  BaseUserEvent();
  @override
  List<Object?> get props => [];
}

class AddUserEvent extends BaseUserEvent{
  final String userName;
  final String password;
  final String email;
   String? image;
  final String interstedId;



  AddUserEvent({
    required  this.userName,
    required  this.password,
    required this.email,
      this.image,
    required  this.interstedId,

  });


}
class GetUserImageEvent extends BaseUserEvent{}
class GetInterestDataEvent extends BaseUserEvent{}