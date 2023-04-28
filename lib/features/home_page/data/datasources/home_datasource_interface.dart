import '../models/note_model.dart';

abstract class HomeDatasourceInterface {
  Future<List<NoteModel>> getNotes();
}
