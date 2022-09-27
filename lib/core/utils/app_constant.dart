

import 'package:equatable/equatable.dart';

import 'end_points.dart';


class AppConstant{

  static const baseUrl="https://noteapi.popssolutions.net";

  static const getNotes="$baseUrl/$Notes/getall";

  static String getNoteData(String id)=>"$baseUrl/$Notes/get/$id";
  static String updateNoteData(String id)=>"$baseUrl/$Notes/update/$id";
  static const getUsers="$baseUrl/$Users/getall";
  static const insertUser="$baseUrl/$Users/insert";
  static const insertNote="$baseUrl/$Notes/insert";
  static const getInterest="$baseUrl/$Interests/getall";

}

class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

String? userArea;



