import 'package:dartz/dartz.dart';

import '../../domain/entities/note.dart';

abstract class HomeRepositoryInterface {
  Future<Either<Exception, List<Note>>> getNotes();
}
