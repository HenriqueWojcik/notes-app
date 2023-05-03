import 'package:dartz/dartz.dart';

import '../../../home_page/domain/entities/note.dart';

abstract class NewNoteRepositoryInterface {
  Future<Either<void, Exception>> createNote(Note note);
}
