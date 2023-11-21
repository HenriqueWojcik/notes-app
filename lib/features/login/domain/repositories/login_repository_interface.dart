import '../../../../core/entities/failure.dart';

abstract class LoginRepositoryInterface {
  Future<(Failure?, void)> loginWithGoogle();
}
