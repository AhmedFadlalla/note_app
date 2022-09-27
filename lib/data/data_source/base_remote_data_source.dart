import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:note_app/core/error/exceptions.dart';
import 'package:note_app/core/utils/app_constant.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/data/models/interest_data_model.dart';
import 'package:http/http.dart' as http;
import '../../core/network/error_message_model.dart';
import '../../core/network/error_result_model.dart';
import '../models/note_data_model.dart';
import '../models/user_data_model.dart';

abstract class BaseRemoteDataSource {
Future<List<NoteDataModel>>  getNotes();
Future<NoteDataModel>  getNoteData(NoteParameter parameter);
Future<void>  updateNoteData(NoteParameter parameter);
Future<void>  insertNote(NoteParameter parameter);
Future<List<UserDataModel>>  getAllUsers();
Future<void>  addUserData(UserParameter parameter);
Future<List<InterestDataModel>>  getInterestData();
}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<List<NoteDataModel>> getNotes()async {
    final response=await Dio().get(AppConstant.getNotes);

    if(response.statusCode==200){
      return List<NoteDataModel>.from((response.data as List).map((e) => NoteDataModel.fromJson(e)));
    }else{
      throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
    }
  }

  @override
  Future<NoteDataModel> getNoteData(NoteParameter parameter)async {
  final response=await Dio().get(AppConstant.getNoteData(parameter.id));

  if(response.statusCode==200){
    return  NoteDataModel.fromJson(response.data);
  }else{
    throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
  }


  }

  @override
  Future<List<UserDataModel>> getAllUsers() async{
    final response=await Dio().get(AppConstant.getUsers);

    if(response.statusCode==200){
      return  List<UserDataModel>.from((response.data as List).map((e) => UserDataModel.fromJson(e)));
    }else{
      throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
    }

  }

  @override
  Future<void> addUserData(UserParameter parameter) async{
    final http.Response response=await http.post(
      Uri.parse(AppConstant.insertUser),
        headers: {
          "Content-Type":"application/json"
        },
      body: jsonEncode({
          "username":parameter.userName,
          "password":parameter.password,
          "email":parameter.email,
          "imageAsBase64":parameter.image,
          "intrestId":parameter.interstedId,
      })
    );




  }

  @override
  Future<List<InterestDataModel>> getInterestData() async{
   final response=await Dio().get(AppConstant.getInterest);
   if(response.statusCode==200){
     return List<InterestDataModel>.from((response.data as List).map((e) => InterestDataModel.fromJson(e)));
   }else{
     throw ServerException(errorResultModel: ErrorResultModel.fromJson(response.data));
   }
  }

  @override
  Future<void> updateNoteData(NoteParameter parameter) async{
    final http.Response response=
    await http.put(
        Uri.parse(AppConstant.updateNoteData(parameter.id)),
        headers: {
          "Content-Type":"application/json"
        },
      body: jsonEncode(
        {
          "text":parameter.text,
          "placeDateTime":parameter.dateTime
        }
      )
    );
  }

  @override
  Future<void> insertNote(NoteParameter parameter) async{
   await http.post(
       Uri.parse(AppConstant.insertNote),
     headers: {
       "Content-Type":"application/problem+json; charset=utf-8"
     },
     body: jsonEncode(
         {
           "text":parameter.text,
           "placeDateTime":parameter.dateTime,
           "userId":parameter.userId
         }
     )
   );
  }

}