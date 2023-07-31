import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../../home_page/domain/entities/note.dart';

abstract class NewNoteRepositoryInterface {
  Future<Either<Failure, Note>> getNoteById(String id);
  Future<Either<Failure, void>> createNote(Note? note);
  Future<Either<Failure, void>> editNote(Note? note);
  Future<Either<Failure, void>> deleteNote(Note? note);
}
