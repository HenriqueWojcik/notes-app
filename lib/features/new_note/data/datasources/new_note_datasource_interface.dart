import '../../../home_page/data/models/note_model.dart';

abstract class NewNoteDatasourceInterface {
  Future<void> createNote(NoteModel noteModel);
}