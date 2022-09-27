import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';

import '../entities/base_note_data.dart';
import '../repository/base_note_repo.dart';

class GetNotesUseCase extends BaseUseCase<List<BaseNoteData>,NoParameters>{
  final BaseNoteRepository baseNoteRepository;


  GetNotesUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, List<BaseNoteData>>> call(NoParameters parameter)async {
    return await baseNoteRepository.getNotes();
  }



}