import '../../../../core/data/communication_inferface.dart';
import '../../../../core/entities/request.dart';
import '../models/note_model.dart';
import 'home_datasource_interface.dart';

class HomeDatasourceImpl implements HomeDatasourceInterface {
  final CommunicationInterface communication;

  HomeDatasourceImpl({required this.communication});

  @override
  Future<List<NoteModel>> getNotes() async {
    final value = await communication.get(
      Request(collection: 'notes'),
    );

    return value.map((e) => NoteModel.fromJson(e)).toList();
  }
}
