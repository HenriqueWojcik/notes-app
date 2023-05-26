import '../../../home_page/data/models/note_model.dart';

abstract class NewNoteDatasourceInterface {
  Future<void> createNote(NoteModel noteModel);
  Future<void> editNote(NoteModel noteModel);
  Future<void> deleteNote(NoteModel noteModel);
}
