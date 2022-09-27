import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

import '../entities/base_intrest_data.dart';

class GetInterestDataUseCase extends BaseUseCase<List<BaseInterestData>,NoParameters>{
  final BaseNoteRepository baseNoteRepository;

  GetInterestDataUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, List<BaseInterestData>>> call(NoParameters parameter)async {
   return await baseNoteRepository.getInterestData();
  }

}