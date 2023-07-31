import 'package:dartz/dartz.dart';

import '../data/error/error_handler.dart';
import '../entities/failure.dart';
import '../print/print.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository<EH extends ErrorHandler> {
  final EH? errorHandler;

  BaseRepository({this.errorHandler});

  Future<Either<Failure, T>> doAsync<T>(
    Task<T> task,
  ) async {
    try {
      final value = await task();

      return Right(value);
    } on Exception catch (e, stack) {
      debugPrint('>>>>>>>>> Exception $e');
      debugPrint('>>>>>>>>> StackTrace $stack');

      final Failure? error = errorHandler?.handleError(e);

      if (error != null) {
        return Left(error);
      }

      return Left(Failure(message: e.toString()));
    }
  }
}
