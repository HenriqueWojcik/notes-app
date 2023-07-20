import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/communication_inferface.dart';
import '../../../../core/entities/request.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/print/print.dart';
import '../../../../injectors.dart';
import '../../../home_page/data/models/note_model.dart';
import 'new_note_datasource_interface.dart';

class NewNoteDatasourceImpl implements NewNoteDatasourceInterface {
  final CommunicationInterface communication;

  NewNoteDatasourceImpl({required this.communication});

  User get user => getIt();

  @override
  Future<NoteModel> getNoteById(String id) async {
    final request = AppRequest(
      collection: 'notes',
      parameters: {'id': id},
    );

    final value = await communication.get(request);

    debugPrint(value);

    return NoteModel.fromJson(value.first);
  }

  @override
  Future<void> createNote(NoteModel noteModel) async {
    noteModel.userId = user.uid;

    final request = AppRequest(
      collection: 'notes',
      parameters: noteModel.toJson(),
    );

    final value = await communication.post(request);

    if (value.containsKey('id')) {
      return;
    }

    throw Exception(I18n.strings.errorCreatingNote);
  }

  @override
  Future<void> editNote(NoteModel noteModel) async {
    final request = AppRequest(
      collection: 'notes',
      parameters: noteModel.toJson(),
    );

    await communication.put(request);
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) async {
    final request = AppRequest(
      collection: 'notes',
      parameters: noteModel.toJson(),
    );

    final value = await communication.delete(request);

    return value;
  }
}
