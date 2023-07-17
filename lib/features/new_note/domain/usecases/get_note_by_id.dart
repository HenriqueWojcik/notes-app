import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class GetNoteById {
  final NewNoteRepositoryInterface repository;

  GetNoteById({required this.repository});

  Future<Either<Exception, Note>> call(String id) => repository.getNoteById(id);
}
