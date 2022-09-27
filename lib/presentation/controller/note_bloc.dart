import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/core/utils/enum.dart';

import '../../domain/use_case/get_note_use_case.dart';
import '../../domain/use_case/get_notes_use_case.dart';
import '../../domain/use_case/get_users_data.dart';
import '../../domain/use_case/insert_note_use_case.dart';
import '../../domain/use_case/update_note_data_use_case.dart';
import 'note_event.dart';
import 'note_state.dart';



class NoteBloc extends Bloc<BaseNoteEvent, NoteState> {
  final GetNotesUseCase getNotesUseCase;
  final GetNoteUseCase getNoteUseCase;
  final GetUsersDataUseCase getUsersUseCase;
  final UpdateNoteDataUseCase updateNoteDataUseCase;
  final InsertNoteUseCase insertNoteUseCase;
  NoteBloc(this.getNotesUseCase
      ,this.getNoteUseCase,
      this.getUsersUseCase,
      this.updateNoteDataUseCase,
      this.insertNoteUseCase
      )
      : super(NoteState()) {
    on<GetNotesEvent>((event, emit) async{
      final result=await  getNotesUseCase(const NoParameters());

      result.fold((l) => emit(
        state.copyWith(
          notesDataMessage: l.message,
          notesDataState: RequestState.error
        )
      ),
              (r) => emit(
                state.copyWith(
                  notesData: r,
                  notesDataState: RequestState.loaded
                )
              ));
    });

    on<GetNoteDataEvent>((event, emit) async{
      final result=await getNoteUseCase(NoteParameter(id: event.noteId));

      result.fold((l) => emit(
          state.copyWith(
              noteDataMessage: l.message,
              noteDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(
                  noteData: r,
                  noteDataState: RequestState.loaded
              )
          ));

    });

    on<GetAllUsersEvent>((event, emit) async{
      final result=await getUsersUseCase(const NoParameters());
      result.fold((l) => emit(
          state.copyWith(
              usersDataMessage: l.message,
              usersDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(
                  usersData: r,
                  usersDataState: RequestState.loaded
              )
          ));

    });
    on<UpdateNoteDataEvent>((event, emit) async{
      final result=await updateNoteDataUseCase(
        NoteParameter(
            id: event.id,
          dateTime: event.dateTime,
          text: event.text
        )
      );
      result.fold((l) => emit(
          state.copyWith(
              updateNoteDataMessage: l.message,
              updateNoteDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(

                  updateNoteDataState: RequestState.loaded
              )
          ));
    });

    on<InsertNoteEvent>((event, emit) async{
      final result=await insertNoteUseCase(
          NoteParameter(
              userId: event.userId,
              dateTime: event.dateTime,
              text: event.text,
              id: ""
          )
      );
      result.fold((l) => emit(
          state.copyWith(
              insertNoteDataMessage: l.message,
              insertNoteDataState: RequestState.error
          )
      ),
              (r) => emit(
              state.copyWith(

                  insertNoteDataState: RequestState.loaded
              )
          ));
    });
  }
}
