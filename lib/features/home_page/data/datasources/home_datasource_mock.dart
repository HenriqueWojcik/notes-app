import '../../../../core/data/base_datasource_mock.dart';
import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceMock extends BaseDatasourceMock
    implements HomeDatasourceInterface {
  @override
  Future<List<NoteModel>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }
}
