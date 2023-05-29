import '../../../home_page/data/models/note_model.dart';
import 'new_note_datasource_interface.dart';

class NewNoteDatasourceMock implements NewNoteDatasourceInterface {
  @override
  Future<void> createNote(NoteModel noteModel) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<void> editNote(NoteModel noteModel) {
    // TODO: implement editNote
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }
}
