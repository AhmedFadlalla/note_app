import '../../domain/entities/base_note_data.dart';

class NoteDataModel extends BaseNoteData {
  NoteDataModel(
      {required super.text,
      required super.dateTime,
      required super.userId,
      required super.noteId});

  factory NoteDataModel.fromJson(Map<String,dynamic> json){
    return NoteDataModel(
        text: json["text"],
        dateTime: json["placeDateTime"],
        userId: json["userId"]??"",
        noteId:json["id"]);
  }
}
