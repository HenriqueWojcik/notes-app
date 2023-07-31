import 'package:dartz/dartz.dart';
import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/core/helpers/dart_z_externsion.dart';
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
        .thenAnswer((_) async => const Right(null));

    final result = await sut();

    expect(result.isRight(), true);
  });

  test('should return a Exception if something fails', () async {
    final Failure failure = Failure(message: '');
    when(repository.loginWithGoogle()).thenAnswer((_) async => Left(failure));

    final result = await sut();

    expect(result.isLeft(), true);
    expect(result.asLeft(), failure);
  });
}
