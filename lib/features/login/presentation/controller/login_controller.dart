import '../../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUseCase loginWithGoogle;

  LoginController({
    required this.loginWithGoogle,
  });

  Future<void> login() async {
    await loginWithGoogle();
  }
}
