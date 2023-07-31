import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../data/repositories/home_repository_interface.dart';
import '../entities/note.dart';

class GetNotesUsecase {
  final HomeRepositoryInterface repository;

  GetNotesUsecase({required this.repository});

  Future<Either<Failure, List<Note>>> call() => repository.getNotes();
}
