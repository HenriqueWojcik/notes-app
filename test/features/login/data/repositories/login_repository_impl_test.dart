import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/core/helpers/dart_z_externsion.dart';
import 'package:flutter_notes_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';

void main() {
  late LoginRepositoryImpl sut;
  late MockLoginDatasourceInterface datasource;

  setUp(() {
    datasource = MockLoginDatasourceInterface();
    sut = LoginRepositoryImpl(datasource: datasource);
  });

  test('should return a either with a void result when success', () async {
    when(datasource.loginWithGoogle()).thenAnswer((_) async => MockUser());

    final result = await sut.loginWithGoogle();

    expect(result.isRight(), true);
  });

  test(
    'should return a exception when something got wrong in datasource',
    () async {
      final Failure exception = Failure(message: '');
      when(datasource.loginWithGoogle()).thenThrow(exception);

      final result = await sut.loginWithGoogle();

      expect(result.isLeft(), true);
      expect(result.asLeft(), exception);
    },
  );
}
