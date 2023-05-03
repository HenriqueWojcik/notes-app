import 'package:dartz/dartz.dart';

import '../print/print.dart';

class BaseRepository {
  Future<Either<T, Exception>> doAsync<T>(
    Function() function,
  ) async {
    try {
      final value = await function();

      return Left(value);
    } on Exception catch (e, stack) {
      debugPrint('>>>>>>>>> Exception $e');
      debugPrint('>>>>>>>>> StackTrace $stack');
      return Right(e);
    }
  }
}
