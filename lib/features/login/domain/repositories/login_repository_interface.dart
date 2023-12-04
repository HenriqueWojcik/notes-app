import 'package:my_foundation/main.dart';

abstract class LoginRepositoryInterface {
  Future<(Failure?, void)> loginWithGoogle();
}
