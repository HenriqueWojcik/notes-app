import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';
import '../repositories/new_note_repository_interface.dart';

class DeleteNoteUseCase {
  final NewNoteRepositoryInterface repository;

  DeleteNoteUseCase({required this.repository});

  Future<Either<Failure, void>> call(Note? note) async {
    return await repository.deleteNote(note);
  }
}
