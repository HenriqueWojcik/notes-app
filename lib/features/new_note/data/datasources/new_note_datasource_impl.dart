import '../../../../core/data/communication_inferface.dart';
import '../../../../core/entities/request.dart';
import '../../../home_page/data/models/note_model.dart';
import 'new_note_datasource_interface.dart';

class NewNoteDatasourceImpl implements NewNoteDatasourceInterface {
  final CommunicationInterface communication;

  NewNoteDatasourceImpl({required this.communication});

  @override
  Future<void> createNote(NoteModel noteModel) async {
    final request = Request(
      collection: 'notes',
      data: noteModel.toJson(),
    );

    final value = await communication.post(request);

    if (value.containsKey('id')) {
      return;
    }

    throw Exception('Erro ao criar nota');
  }

  @override
  Future<void> editNote(NoteModel noteModel) async {
    final request = Request(
      collection: 'notes',
      data: noteModel.toJson(),
    );

    await communication.put(request);
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) async {
    final request = Request(
      collection: 'notes',
      data: noteModel.toJson(),
    );

    final value = await communication.delete(request);

    return value;
  }
}
