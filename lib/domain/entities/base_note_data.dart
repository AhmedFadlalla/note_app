import 'package:equatable/equatable.dart';

class BaseNoteData extends Equatable {
  final String text;
  final String dateTime;
  final String userId;
  final String noteId;

  BaseNoteData({
    required this.text,
    required this.dateTime,
    required this.userId,
    required this.noteId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [text, dateTime, userId, noteId];
}
