import 'package:firebase_auth/firebase_auth.dart';

import 'login_datasource_interface.dart';

class LoginDatasourceMock implements LoginDatasourceInterface {
  @override
  Future<User> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
