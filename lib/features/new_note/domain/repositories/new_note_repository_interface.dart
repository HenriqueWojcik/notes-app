import 'package:my_foundation/main.dart';

import '../../../home_page/domain/entities/note.dart';

abstract class NewNoteRepositoryInterface {
  Future<(Failure?, Note?)> getNoteById(String id);
  Future<(Failure?, void)> createNote(Note? note);
  Future<(Failure?, void)> editNote(Note? note);
  Future<(Failure?, void)> deleteNote(Note? note);
}
