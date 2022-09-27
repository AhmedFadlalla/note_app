import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/entities/base_intrest_data.dart';
import '../../../domain/entities/base_user_data.dart';


class UserState extends Equatable {

  final BaseUserData? userData;
  final RequestState userDataState;
  final String userDataMessage;
  final  File? userImage;
  final RequestState userImageState;
  final String userImageMessage;
  final List<BaseInterestData> interestsData;
  final RequestState interestsDataState;
  final String interestsDataMessage;

  UserState({
    this.userData,
    this.userDataState = RequestState.loading,
    this.userDataMessage = '',
    this.userImage ,
    this.userImageState = RequestState.loading,
    this.userImageMessage = '',
    this.interestsData=const [] ,
    this.interestsDataState = RequestState.loading,
    this.interestsDataMessage = '',
  });

  UserState copyWith({


    BaseUserData? userData,
    RequestState? userDataState,
    String? userDataMessage,
    File? userImage,
    RequestState? userImageState,
    String? userImageMessage,
    List<BaseInterestData>? interestsData,
    RequestState? interestsDataState,
    String? interestsDataMessage,
  }){
    return UserState(

      userData: userData??this.userData,
      userDataState: userDataState??this.userDataState,
      userDataMessage: userDataMessage??this.userDataMessage,
      userImage: userImage??this.userImage,
      userImageState: userImageState??this.userImageState,
      userImageMessage: userImageMessage??this.userImageMessage,
      interestsData: interestsData??this.interestsData,
      interestsDataState: interestsDataState??this.interestsDataState,
      interestsDataMessage: interestsDataMessage??this.interestsDataMessage,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
   userDataState,userDataMessage,
    userImage,userImageState,userImageMessage,
    interestsData,interestsDataState,interestsDataMessage
  ];
}
