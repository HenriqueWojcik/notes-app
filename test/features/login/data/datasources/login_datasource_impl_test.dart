import 'package:flutter_notes_app/core/entities/app_user.dart';
import 'package:flutter_notes_app/features/login/data/datasources/login_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';

void main() {
  late LoginDatasourceImpl sut;
  late MockFirebaseHelper firebaseHelper;

  setUp(() {
    firebaseHelper = MockFirebaseHelper();
    sut = LoginDatasourceImpl(
      firebaseHelper: firebaseHelper,
    );
  });

  test('should return user correctly', () async {
    final mockUser = MockUser();

    when(firebaseHelper.loginWithGoogle()).thenAnswer((_) async => mockUser);

    when(mockUser.uid).thenReturn('123');
    when(mockUser.displayName).thenReturn('mock');
    when(mockUser.email).thenReturn('user@mock.com');
    when(mockUser.photoURL).thenReturn('');

    final result = await sut.loginWithGoogle();

    final user = AppUser.fromFirebaseUser(mockUser);

    expect(result.uid, user.uid);
    expect(result.displayName, user.displayName);
    expect(result.email, user.email);
    expect(result.photoURL, user.photoURL);

    verify(firebaseHelper.loginWithGoogle()).called(1);
  });
}
