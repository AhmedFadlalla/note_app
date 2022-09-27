import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

import '../entities/base_user_data.dart';

class GetUsersDataUseCase extends BaseUseCase<List<BaseUserData>,NoParameters>{
  final BaseNoteRepository baseNoteRepository;


  GetUsersDataUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, List<BaseUserData>>> call(NoParameters parameter) async{
    return await baseNoteRepository.getUsersData();
  }

}