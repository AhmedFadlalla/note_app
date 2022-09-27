

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/utils/constrant.dart';

import '../entities/base_intrest_data.dart';
import '../entities/base_note_data.dart';
import '../entities/base_user_data.dart';

abstract class BaseNoteRepository{

  Future<Either<Failure,List<BaseNoteData>>> getNotes();
  Future<Either<Failure,BaseNoteData>> getNoteData(NoteParameter parameter);
  Future<Either<Failure,void>> updateNoteData(NoteParameter parameter);
  Future<Either<Failure,void>> insertNote(NoteParameter parameter);
    Future<Either<Failure,List<BaseUserData>>> getUsersData();
  Future<Either<Failure,void>> addUserData(UserParameter parameter);
  Future<Either<Failure,File>> getUserImage();
  Future<Either<Failure,List<BaseInterestData>>> getInterestData();

}