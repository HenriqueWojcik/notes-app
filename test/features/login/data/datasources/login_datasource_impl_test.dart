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
    final user = MockUser();

    when(firebaseHelper.loginWithGoogle()).thenAnswer((_) async => user);

    final result = await sut.loginWithGoogle();

    expect(result, user);
    verify(firebaseHelper.loginWithGoogle()).called(1);
  });
}
