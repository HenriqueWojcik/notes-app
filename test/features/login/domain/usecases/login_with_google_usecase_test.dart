import 'package:flutter_notes_app/core/entities/failure.dart';

import 'package:flutter_notes_app/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';

void main() {
  late LoginWithGoogleUsecase sut;
  late MockLoginRepositoryInterface repository;

  setUp(() {
    repository = MockLoginRepositoryInterface();
    sut = LoginWithGoogleUsecase(repository: repository);
  });

  test('should return as Right if return successfully', () async {
    when(repository.loginWithGoogle())
        .thenAnswer((_) async => (null, MockUser()));

    final (Failure? failure, void _) = await sut();

    expect(failure == null, true);
  });

  test('should return a Exception if something fails', () async {
    final Failure error = Failure(message: '');
    when(repository.loginWithGoogle()).thenAnswer((_) async => (error, null));

    final (Failure? failure, void _) = await sut();

    expect(failure != null, true);
    expect(failure, error);
  });
}
