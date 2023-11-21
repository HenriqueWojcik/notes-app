import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class DeleteNoteUseCase {
  final NewNoteRepositoryInterface repository;

  DeleteNoteUseCase({required this.repository});

  Future<(Failure?, void)> call(Note? note) => repository.deleteNote(note);
}
