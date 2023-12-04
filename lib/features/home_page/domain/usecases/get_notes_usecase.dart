import 'package:my_foundation/main.dart';

import '../../data/repositories/home_repository_interface.dart';
import '../entities/note.dart';

class GetNotesUsecase {
  final HomeRepositoryInterface repository;

  GetNotesUsecase({required this.repository});

  Future<(Failure?, List<Note>?)> call() => repository.getNotes();
}
