import 'package:note_app/domain/entities/base_intrest_data.dart';

class InterestDataModel extends BaseInterestData{
  InterestDataModel({required super.id, required super.name});

  factory InterestDataModel.fromJson(Map<String,dynamic>json)
  =>InterestDataModel(id: json["id"],
      name: json["intrestText"]);
}