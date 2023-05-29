import 'package:dartz/dartz.dart';

import '../entities/note.dart';

class SearchNotesUsecase {
  Either<List<Note>?, Exception> call(List<Note> notes, String value) {
    try {
      List<Note> result = [];

      if (value.isEmpty) {
        result = notes;
      } else {
        result = notes.where((note) {
          return note.title.toLowerCase().contains(value.toLowerCase()) ||
              note.body.toLowerCase().contains(value.toLowerCase());
        }).toList();
      }
      return Left(result);
    } on Exception catch (e) {
      return Right(e);
    }
  }
}
