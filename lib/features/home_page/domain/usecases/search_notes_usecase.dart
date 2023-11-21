import '../../../../core/entities/failure.dart';
import '../entities/note.dart';

class SearchNotesUsecase {
  (Failure?, List<Note>?) call(List<Note> notes, String value) {
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
      return (null, result);
    } on Exception catch (e) {
      return (Failure(message: e.toString()), null);
    }
  }
}
