import 'package:dartz/dartz.dart';

import '../entities/failure.dart';
import '../print/print.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository {
  Future<Either<Failure, T>> doAsync<T>(
    Task<T> task,
  ) async {
    try {
      final value = await task();

      return Right(value);
    } on Exception catch (e, stack) {
      debugPrint('>>>>>>>>> Exception $e');
      debugPrint('>>>>>>>>> StackTrace $stack');

      return Left(Failure(message: e.toString()));
    }
  }
}
