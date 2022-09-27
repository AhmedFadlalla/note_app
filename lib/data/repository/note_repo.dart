
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/domain/entities/base_intrest_data.dart';

import 'package:note_app/domain/entities/base_note_data.dart';
import 'package:note_app/domain/entities/base_user_data.dart';

import '../../domain/repository/base_note_repo.dart';
import '../data_source/base_local_data_source.dart';
import '../data_source/base_remote_data_source.dart';

class NoteRepository extends BaseNoteRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  final BaseLocalDataSource baseLocalDataSource;

  NoteRepository(this.baseRemoteDataSource,this.baseLocalDataSource);

  @override
  Future<Either<Failure, List<BaseNoteData>>> getNotes() async{
  final result=await baseRemoteDataSource.getNotes();

  try{
    return Right(result);
  }on ServerFailure catch(failure){
    return Left(ServerFailure(failure.message));
  }
  }

  @override
  Future<Either<Failure, BaseNoteData>> getNoteData(NoteParameter parameter) async{
    final result=await baseRemoteDataSource.getNoteData(parameter);

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }


  }

  @override
  Future<Either<Failure, List<BaseUserData>>> getUsersData()async {
    final result=await baseRemoteDataSource.getAllUsers();

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> addUserData(UserParameter parameter) async{
    final result=await baseRemoteDataSource.addUserData(parameter);

    try{
      return Right(print("Success"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, File>> getUserImage() async{
   final result= await baseLocalDataSource.getImage();
   try{
     return Right(result);
   }on LocalFailure catch(failure){
     return Left(LocalFailure(failure.message));
   }

  }

  @override
  Future<Either<Failure, List<BaseInterestData>>> getInterestData() async{
    final result=await baseRemoteDataSource.getInterestData();

    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateNoteData(NoteParameter parameter) async{
    await baseRemoteDataSource.updateNoteData(parameter);

    try{
      return Right(print("Update Successfully"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> insertNote(NoteParameter parameter) async{
    await baseRemoteDataSource.insertNote(parameter);

    try{
      return Right(print("Insert Successfully"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }




}