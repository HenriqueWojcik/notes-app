import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDatasourceInterface {
  Future<User> loginWithGoogle();
}
