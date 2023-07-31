import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';

abstract class LoginRepositoryInterface {
  Future<Either<Failure, void>> loginWithGoogle();
}
