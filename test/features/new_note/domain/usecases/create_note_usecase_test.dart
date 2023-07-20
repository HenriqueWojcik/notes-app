import 'package:dartz/dartz.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/create_note_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late CreateNoteUseCase sut;
  late MockNewNoteRepositoryInterface repository;

  setUp(() {
    repository = MockNewNoteRepositoryInterface();
    sut = CreateNoteUseCase(repository: repository);
  });

  test('should return correctly a right either correctly', () async {
    when(repository.createNote(any))
        .thenAnswer((_) => Future.value(const Right(null)));

    final result = await sut(NoteSample.sample());

    expect(result.isRight(), true);
  });

  test('should return correctly a right either correctly', () async {
    when(repository.createNote(any))
        .thenAnswer((_) => Future.value(Left(Exception())));

    final result = await sut(NoteSample.sample());

    expect(result.isLeft(), true);
  });
}
