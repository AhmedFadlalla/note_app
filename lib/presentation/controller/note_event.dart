import 'package:equatable/equatable.dart';

abstract class BaseNoteEvent extends Equatable {
  BaseNoteEvent();

  @override
  List<Object?> get props => [];
}

class GetNotesEvent extends BaseNoteEvent {}

class GetNoteDataEvent extends BaseNoteEvent {
  final String noteId;

  GetNoteDataEvent({required this.noteId});
}

class GetAllUsersEvent extends BaseNoteEvent {}

class UpdateNoteDataEvent extends BaseNoteEvent {
  final String id;
  final String text;
  final String dateTime;

  UpdateNoteDataEvent(
      {required this.id, required this.text, required this.dateTime});
}

class InsertNoteEvent extends BaseNoteEvent {
  final String text;
  final String dateTime;
  final String userId;

  InsertNoteEvent({
   required this.text,
    required this.dateTime,
    required this.userId,
  });
}
