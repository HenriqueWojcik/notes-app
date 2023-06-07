import 'package:dartz/dartz.dart';

abstract class LoginRepositoryInterface {
  Future<Either<Exception, void>> loginWithGoogle();
}
