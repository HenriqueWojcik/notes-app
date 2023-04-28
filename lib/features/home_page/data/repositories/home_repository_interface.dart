import 'package:dartz/dartz.dart';

import '../../domain/entities/note.dart';

abstract class HomeRepositoryInterface {
  Future<Either<List<Note>, Exception>> getNotes();
}
