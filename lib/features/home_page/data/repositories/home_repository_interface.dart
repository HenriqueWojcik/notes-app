import '../../../../core/entities/failure.dart';
import '../../domain/entities/note.dart';

abstract class HomeRepositoryInterface {
  Future<(Failure?, List<Note>?)> getNotes();
}
