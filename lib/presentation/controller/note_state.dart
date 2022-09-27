import 'package:equatable/equatable.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/utils/enum.dart';
import '../../domain/entities/base_note_data.dart';
import '../../domain/entities/base_user_data.dart';

class NoteState extends Equatable {
  final List<BaseNoteData> notesData;
  final RequestState notesDataState;
  final String notesDataMessage;
  final BaseNoteData ?noteData;
  final RequestState noteDataState;
  final String noteDataMessage;
  final List<BaseUserData> usersData;
  final RequestState usersDataState;
  final String usersDataMessage;
  final RequestState updateNoteDataState;
  final String updateNoteDataMessage;
  final RequestState insertNoteDataState;
  final String insertNoteDataMessage;

  NoteState({
    this.notesData = const [],
    this.notesDataState = RequestState.loading,
    this.notesDataMessage = '',
    this.noteData ,
    this.noteDataState = RequestState.loading,
    this.noteDataMessage = '',
    this.usersData = const [],
    this.usersDataState = RequestState.loading,
    this.usersDataMessage = '',
    this.updateNoteDataState = RequestState.loading,
    this.updateNoteDataMessage = '',
    this.insertNoteDataState = RequestState.loading,
    this.insertNoteDataMessage = '',
  });

  NoteState copyWith({
    List<BaseNoteData>? notesData,
    RequestState? notesDataState,
    String? notesDataMessage,
    BaseNoteData? noteData,
    RequestState? noteDataState,
    String? noteDataMessage,
    List<BaseUserData>? usersData,
    RequestState? usersDataState,
    String? usersDataMessage,
    RequestState? updateNoteDataState,
    String? updateNoteDataMessage,
    RequestState? insertNoteDataState,
    String? insertNoteDataMessage,
}){
    return NoteState(
      notesData: notesData??this.notesData,
      notesDataState: notesDataState??this.notesDataState,
      notesDataMessage: notesDataMessage??this.notesDataMessage,
        noteData: noteData??this.noteData,
        noteDataState: noteDataState??this.noteDataState,
        noteDataMessage: noteDataMessage??this.noteDataMessage,
      usersData: usersData??this.usersData,
      usersDataState: usersDataState??this.usersDataState,
      usersDataMessage: usersDataMessage??this.usersDataMessage,
      updateNoteDataState: updateNoteDataState??this.updateNoteDataState,
      updateNoteDataMessage: updateNoteDataMessage??this.updateNoteDataMessage,
      insertNoteDataState: insertNoteDataState??this.insertNoteDataState,
      insertNoteDataMessage: insertNoteDataMessage??this.insertNoteDataMessage
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    notesData, notesDataState, notesDataMessage,
    noteData,noteDataState,noteDataMessage,
    usersData,usersDataState,usersDataMessage,
    updateNoteDataState,updateNoteDataMessage,
    insertNoteDataState,insertNoteDataMessage
  ];
}
