import 'package:my_foundation/main.dart';

import '../../domain/entities/note.dart';

abstract class HomeRepositoryInterface {
  Future<(Failure?, List<Note>?)> getNotes();
}
