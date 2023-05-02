import 'package:dartz/dartz.dart';

import '../../../../core/repositories/base_repository.dart';

import '../../data/datasources/home_datasource_interface.dart';
import '../../data/mappers/note_mapper.dart';
import '../../data/repositories/home_repository_interface.dart';
import '../entities/note.dart';

class HomeRepositoryImpl extends BaseRepository
    implements HomeRepositoryInterface {
  final HomeDatasourceInterface datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<List<Note>, Exception>> getNotes() {
    return doAsync<List<Note>>(() async {
      final data = await datasource.getNotes();

      return NoteMappper.toEntityList(data);
    });
  }
}
