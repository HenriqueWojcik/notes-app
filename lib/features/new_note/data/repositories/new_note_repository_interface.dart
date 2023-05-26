import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';

abstract class NewNoteRepositoryInterface {
  Future<Either<void, Exception>> createNote(Note? note);
  Future<Either<void, Exception>> editNote(Note? note);
  Future<Either<void, Exception>> deleteNote(Note? note);
}
