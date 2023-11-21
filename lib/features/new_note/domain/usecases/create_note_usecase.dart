import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class CreateNoteUseCase {
  final NewNoteRepositoryInterface repository;

  CreateNoteUseCase({
    required this.repository,
  });

  Future<(Failure?, void)> call(Note? note) => repository.createNote(note);
}
