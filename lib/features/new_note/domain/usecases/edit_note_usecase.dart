import 'package:my_foundation/main.dart';

import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class EditNoteUsecase {
  final NewNoteRepositoryInterface repository;

  EditNoteUsecase({
    required this.repository,
  });

  Future<(Failure?, void)> call(Note? note) => repository.editNote(note);
}
