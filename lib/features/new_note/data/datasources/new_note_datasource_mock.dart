import '../../../../core/data/base_datasource_mock.dart';
import '../../../home_page/data/models/note_model.dart';
import 'new_note_datasource_interface.dart';

class NewNoteDatasourceMock extends BaseDatasourceMock
    implements NewNoteDatasourceInterface {
  @override
  Future<void> createNote(NoteModel noteModel) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> editNote(NoteModel noteModel) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) async {
    return true;
  }

  @override
  Future<NoteModel> getNoteById(String id) async {
    final json = await doAsyncMock('notes.json');

    return (json as List).map((e) => NoteModel.fromJson(e)).firstWhere(
          (element) => element.id == id,
          orElse: () => NoteModel(),
        );
  }
}
