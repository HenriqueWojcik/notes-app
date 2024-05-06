import '../../../../core/entities/app_user.dart';

abstract class LoginDatasourceInterface {
  Future<AppUser> loginWithGoogle();
}
