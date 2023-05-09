import 'package:dartz/dartz.dart';

import '../../../../core/repositories/base_repository.dart';
import '../../../home_page/data/mappers/note_mapper.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../data/datasources/new_note_datasource_interface.dart';
import '../../data/repositories/new_note_repository_interface.dart';

class NewNoteRepositoryImpl extends BaseRepository
    implements NewNoteRepositoryInterface {
  final NewNoteDatasourceInterface datasource;

  NewNoteRepositoryImpl({required this.datasource});

  @override
  Future<Either<void, Exception>> createNote(Note? note) {
    return doAsync(() async {
      if (note == null) {
        throw Exception('Note is null');
      }

      await datasource.createNote(NoteMappper.toModel(note));
    });
  }
}
