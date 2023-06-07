import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';

abstract class NewNoteRepositoryInterface {
  Future<Either<Exception, void>> createNote(Note? note);
  Future<Either<Exception, void>> editNote(Note? note);
  Future<Either<Exception, void>> deleteNote(Note? note);
}
