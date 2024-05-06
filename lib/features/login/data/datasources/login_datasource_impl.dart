import '../../../../core/authentication/firebase_helper.dart';
import '../../../../core/entities/app_user.dart';
import 'login_datasource_interface.dart';

class LoginDatasourceImpl implements LoginDatasourceInterface {
  final FirebaseHelper firebaseHelper;

  LoginDatasourceImpl({
    required this.firebaseHelper,
  });

  @override
  Future<AppUser> loginWithGoogle() async {
    return AppUser.fromFirebaseUser(await firebaseHelper.loginWithGoogle());
  }
}
