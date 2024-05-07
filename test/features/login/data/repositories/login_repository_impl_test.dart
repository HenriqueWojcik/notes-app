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
    when(datasource.loginWithGoogle()).thenAnswer((_) async => MockAppUser());

    final (Failure? failure, void _) = await sut.loginWithGoogle();

    expect(failure == null, true);
  });

  test(
    'should return a exception when something got wrong in datasource',
    () async {
      when(datasource.loginWithGoogle()).thenThrow(Exception());

      final (Failure? failure, void _) = await sut.loginWithGoogle();

      expect(failure?.title.isNotEmpty, true);
      expect(failure?.message.isNotEmpty, true);
    },
  );
}
