import 'package:dartz/dartz.dart';

import '../../data/repositories/home_repository_interface.dart';
import '../entities/note.dart';

class GetNotesUsecase {
  final HomeRepositoryInterface repository;

  GetNotesUsecase({required this.repository});

  Future<Either<List<Note>, Exception>> call() => repository.getNotes();
}
