import 'package:my_foundation/main.dart';

import '../../data/datasources/home_datasource_interface.dart';
import '../../data/error/home_error_handler.dart';
import '../../data/mappers/note_mapper.dart';
import '../../data/repositories/home_repository_interface.dart';
import '../entities/note.dart';

class HomeRepositoryImpl extends BaseRepository<HomeErrorHandler>
    implements HomeRepositoryInterface {
  final HomeDatasourceInterface datasource;

  HomeRepositoryImpl({
    required this.datasource,
    required HomeErrorHandler homeErrorHandler,
  }) : super(errorHandler: homeErrorHandler);

  @override
  Future<(Failure?, List<Note>?)> getNotes() {
    return doAsync<List<Note>>(() async {
      final data = await datasource.getNotes();

      return NoteMappper.toEntityList(data);
    });
  }
}
