import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/domain/entities/base_note_data.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

class GetNoteUseCase extends BaseUseCase<BaseNoteData,NoteParameter>{
  final BaseNoteRepository baseNoteRepository;


  GetNoteUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, BaseNoteData>> call(NoteParameter parameter)async {
    return await baseNoteRepository.getNoteData(parameter);
  }

}