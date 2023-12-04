import 'package:flutter_notes_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_foundation/main.dart';

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

    final (Failure? failure, void _) = await sut.loginWithGoogle();

    expect(failure == null, true);
  });

  test(
    'should return a exception when something got wrong in datasource',
    () async {
      final Failure exception = Failure(message: '', title: '');
      when(datasource.loginWithGoogle()).thenThrow(exception);

      final (Failure? failure, void _) = await sut.loginWithGoogle();

      expect(failure, exception);
    },
  );
}
