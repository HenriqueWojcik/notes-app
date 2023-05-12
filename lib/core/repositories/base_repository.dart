import 'package:dartz/dartz.dart';

import '../print/print.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository {
  Future<Either<T, Exception>> doAsync<T>(
    Task<T> task,
  ) async {
    try {
      final value = await task();

      return Left(value);
    } on Exception catch (e, stack) {
      debugPrint('>>>>>>>>> Exception $e');
      debugPrint('>>>>>>>>> StackTrace $stack');
      return Right(e);
    }
  }
}
