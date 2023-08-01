import '../../../../core/data/base_datasource_mock.dart';
import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceMock extends BaseDatasourceMock
    implements HomeDatasourceInterface {
  @override
  Future<List<NoteModel>> getNotes() async {
    final json = await doAsyncMock('notes.json');

    await Future.delayed(const Duration(seconds: 1));

    return (json as List).map((e) => NoteModel.fromJson(e)).toList();
  }
}
