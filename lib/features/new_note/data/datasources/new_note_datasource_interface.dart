import '../../../home_page/data/models/note_model.dart';

abstract class NewNoteDatasourceInterface {
  Future<NoteModel> getNoteById(String id);
  Future<void> createNote(NoteModel noteModel);
  Future<void> editNote(NoteModel noteModel);
  Future<bool> deleteNote(NoteModel noteModel);
}
