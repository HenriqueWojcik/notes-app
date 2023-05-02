import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceMock implements HomeDatasourceInterface {
  @override
  Future<List<NoteModel>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }
}
