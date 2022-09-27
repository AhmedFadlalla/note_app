import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

class GetUserImageUseCase extends BaseUseCase<File,NoParameters>{
  final BaseNoteRepository baseNoteRepository;


  GetUserImageUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, File>> call(NoParameters parameter)async {
  return await baseNoteRepository.getUserImage();
  }

}