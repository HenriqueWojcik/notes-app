import '../../../../core/data/communication_inferface.dart';
import '../../../../core/entities/request.dart';
import '../../../home_page/data/models/note_model.dart';
import 'new_note_datasource_interface.dart';

class NewNoteDatasourceImpl implements NewNoteDatasourceInterface {
  final CommunicationInterface communication;

  NewNoteDatasourceImpl({required this.communication});

  @override
  Future<void> createNote(NoteModel noteModel) async {
    final value = await communication.post(
      Request(
        collection: 'notes',
        data: noteModel.toJson(),
      ),
    );
  }
}
