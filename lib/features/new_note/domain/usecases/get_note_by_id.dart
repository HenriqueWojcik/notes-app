import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class GetNoteByIdUseCase {
  final NewNoteRepositoryInterface repository;

  GetNoteByIdUseCase({required this.repository});

  Future<Either<Failure, Note>> call(String id) => repository.getNoteById(id);
}
