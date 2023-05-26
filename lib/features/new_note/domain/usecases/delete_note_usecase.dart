import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';
import '../../data/repositories/new_note_repository_interface.dart';

class DeleteNoteUseCase {
  final NewNoteRepositoryInterface repository;

  DeleteNoteUseCase({required this.repository});

  Future<Either<void, Exception>> call(Note? note) async {
    return await repository.deleteNote(note);
  }
}
