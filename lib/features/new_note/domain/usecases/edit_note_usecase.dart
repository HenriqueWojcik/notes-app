import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class EditNoteUsecase {
  final NewNoteRepositoryInterface repository;

  EditNoteUsecase({
    required this.repository,
  });

  Future<Either<Exception, void>> call(Note? note) => repository.editNote(note);
}
