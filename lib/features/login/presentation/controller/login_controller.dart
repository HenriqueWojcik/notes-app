import '../../../../core/state/app_state_extension.dart';
import '../../../../core/state/scaffold_app_state.dart';
import '../../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUseCase loginWithGoogle;

  LoginController({
    required this.loginWithGoogle,
  });

  final scaffoldState = ScaffoldAppState(onSuccessMessage: 'Login success');

  Future<void> login() async {
    scaffoldState.update(loginWithGoogle);
  }

  void dispose() {
    scaffoldState.dispose();
  }
}
