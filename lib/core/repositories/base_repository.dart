import 'package:dartz/dartz.dart';

class BaseRepository {
  Future<Either<T, Exception>> doAsync<T>(
    Function() function,
  ) async {
    try {
      final value = await function();

      return Left(value);
    } on Exception catch (e) {
      return Right(e);
    }
  }
}
