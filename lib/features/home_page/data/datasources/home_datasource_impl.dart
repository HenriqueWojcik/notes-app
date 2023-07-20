import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/communication_inferface.dart';
import '../../../../core/entities/request.dart';
import '../../../../injectors.dart';
import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceImpl implements HomeDatasourceInterface {
  final CommunicationInterface communication;

  HomeDatasourceImpl({required this.communication});

  User get user => getIt();

  @override
  Future<List<NoteModel>> getNotes() async {
    final request = AppRequest(
      collection: 'notes',
      parameters: {'userId': user.uid},
    );

    final value = await communication.get(request);

    return value.map((e) => NoteModel.fromJson(e)).toList();
  }
}
