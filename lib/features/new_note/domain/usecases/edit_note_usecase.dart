import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class EditNoteUsecase {
  final NewNoteRepositoryInterface repository;

  EditNoteUsecase({
    required this.repository,
  });

  Future<Either<Failure, void>> call(Note? note) => repository.editNote(note);
}
