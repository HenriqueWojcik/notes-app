import '../../../../core/data/communication_inferface.dart';
import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceImpl implements HomeDatasourceInterface {
  final CommunicationInterface communication;

  HomeDatasourceImpl({required this.communication});

  @override
  Future<List<NoteModel>> getNotes() async {
    throw Exception();
  }
}
