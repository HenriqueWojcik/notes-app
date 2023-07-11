import '../../../../core/i18n/i18n.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../../../core/state/scaffold_app_state.dart';
import '../../domain/usecases/login_with_google_usecase.dart';

class LoginController {
  final LoginWithGoogleUsecase loginWithGoogle;

  LoginController({
    required this.loginWithGoogle,
  });

  final scaffoldState =
      ScaffoldAppState(onSuccessMessage: I18n.strings.loginSuccess);

  Future<void> login() async {
    scaffoldState.update(loginWithGoogle);
  }

  void dispose() {
    scaffoldState.dispose();
  }
}
