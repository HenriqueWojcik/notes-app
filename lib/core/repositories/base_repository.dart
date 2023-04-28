import 'package:dartz/dartz.dart';

class BaseRepository {
  Future<Either> doAsync(Function() function) async {
    try {
      final value = await function();

      return Left(value);
    } catch (e) {
      return Right(e);
    }
  }
}
