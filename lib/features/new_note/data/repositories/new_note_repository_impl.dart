import 'package:dartz/dartz.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../home_page/data/mappers/note_mapper.dart';
import '../../../home_page/domain/entities/note.dart';
import '../datasources/new_note_datasource_interface.dart';
import '../../domain/repositories/new_note_repository_interface.dart';

class NewNoteRepositoryImpl extends BaseRepository
    implements NewNoteRepositoryInterface {
  final NewNoteDatasourceInterface datasource;

  NewNoteRepositoryImpl({required this.datasource});

  @override
  Future<Either<Exception, void>> createNote(Note? note) {
    return doAsync(() async {
      if (note == null) {
        throw Exception(I18n.strings.noteIsNull);
      }

      await datasource.createNote(NoteMappper.toModel(note));
    });
  }

  @override
  Future<Either<Exception, void>> editNote(Note? note) {
    return doAsync(() async {
      if (note == null) {
        throw Exception(I18n.strings.noteIsNull);
      }

      await datasource.editNote(NoteMappper.toModel(note));
    });
  }

  @override
  Future<Either<Exception, void>> deleteNote(Note? note) async {
    return doAsync(() async {
      if (note == null) {
        throw Exception(I18n.strings.noteIsNull);
      }

      await datasource.deleteNote(NoteMappper.toModel(note));
    });
  }
}
