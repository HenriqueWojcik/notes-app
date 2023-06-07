import 'package:firebase_auth/firebase_auth.dart';

import '../../../../firebase_helper.dart';
import 'login_datasource_interface.dart';

class LoginDatasourceImpl implements LoginDatasourceInterface {
  final FirebaseHelper firebaseHelper;

  LoginDatasourceImpl({
    required this.firebaseHelper,
  });

  @override
  Future<User> loginWithGoogle() async {
    return await firebaseHelper.loginWithGoogle();
  }
}
