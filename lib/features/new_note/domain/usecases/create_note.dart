import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';
import '../../data/repositories/new_note_repository_interface.dart';

class CreateNote {
  final NewNoteRepositoryInterface repository;

  CreateNote({
    required this.repository,
  });

  Future<Either<void, Exception>> call(Note note) =>
      repository.createNote(note);
}
