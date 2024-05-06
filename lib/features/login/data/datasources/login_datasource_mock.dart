import '../../../../core/authentication/firebase_helper.dart';
import '../../../../core/entities/app_user.dart';
import 'login_datasource_impl.dart';

class LoginDatasourceMock implements LoginDatasourceImpl {
  @override
  FirebaseHelper get firebaseHelper => throw UnimplementedError();

  @override
  Future<AppUser> loginWithGoogle() async {
    return AppUser(
      uid: '1234',
      email: 'mock@user.com',
      displayName: 'Mock user',
    );
  }
}
