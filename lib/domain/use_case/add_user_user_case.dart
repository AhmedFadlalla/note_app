import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

import '../entities/base_user_data.dart';

class AddUserDataUseCase extends BaseUseCase<void,UserParameter>{
  final BaseNoteRepository baseNoteRepository;

  AddUserDataUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, void>> call(UserParameter parameter)async {
   return await baseNoteRepository.addUserData(parameter);
  }

}