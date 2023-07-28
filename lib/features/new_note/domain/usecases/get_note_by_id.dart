import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class GetNoteByIdUseCase {
  final NewNoteRepositoryInterface repository;

  GetNoteByIdUseCase({required this.repository});

  Future<Either<Exception, Note>> call(String id) => repository.getNoteById(id);
}
