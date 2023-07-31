import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../domain/entities/note.dart';

abstract class HomeRepositoryInterface {
  Future<Either<Failure, List<Note>>> getNotes();
}
