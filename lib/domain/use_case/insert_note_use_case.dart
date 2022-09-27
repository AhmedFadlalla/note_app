import 'package:dartz/dartz.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/core/use_case/base_use_case.dart';
import 'package:note_app/core/utils/constrant.dart';
import 'package:note_app/domain/repository/base_note_repo.dart';

import '../entities/base_note_data.dart';

class InsertNoteUseCase extends BaseUseCase<void,NoteParameter>{
  final BaseNoteRepository baseNoteRepository;


  InsertNoteUseCase(this.baseNoteRepository);

  @override
  Future<Either<Failure, void>> call(NoteParameter parameter) async{
    return await baseNoteRepository.insertNote(parameter);
  }

}