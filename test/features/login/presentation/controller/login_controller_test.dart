import 'package:flutter_notes_app/core/i18n/i18n.dart';
import 'package:flutter_notes_app/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_foundation/main.dart';

import '../../../../mock/mocks.mocks.dart';

void main() {
  late LoginController sut;
  late MockLoginWithGoogleUsecase loginWithGoogle;

  setUp(() {
    loginWithGoogle = MockLoginWithGoogleUsecase();
    sut = LoginController(
      loginWithGoogle: loginWithGoogle,
    );
  });

  test('should update scaffold state corretly when result is successfully',
      () async {
    final user = MockUser();

    when(loginWithGoogle()).thenAnswer((_) async => (null, user));

    await sut.login();

    expect(sut.scaffoldState.onSuccessMessage, I18n.strings.loginSuccess);
  });

  test('should update scaffold state corretly when result is error', () async {
    const String errorMsg = 'error';
    final failure = Failure(message: errorMsg, title: '');

    when(loginWithGoogle()).thenAnswer((_) async => (failure, null));

    await sut.login();

    expect(sut.scaffoldState.onErrorMessage, failure.toString());
  });

  test('should call state dispose when dispose method is called', () {
    sut.dispose();

    expect(sut.scaffoldState.isDisposed, true);
  });
}
