import 'package:dartz/dartz.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/get_note_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late GetNoteById sut;
  late MockNewNoteRepositoryInterface repository;

  setUp(() {
    repository = MockNewNoteRepositoryInterface();
    sut = GetNoteById(repository: repository);
  });

  test('should return correctly a right either correctly', () async {
    final note = NoteSample.sample();
    when(repository.getNoteById(any))
        .thenAnswer((_) => Future.value(Right(note)));

    final result = await sut('');

    expect(result.isRight(), true);
  });

  test('should return correctly a right either correctly', () async {
    when(repository.getNoteById(any))
        .thenAnswer((_) => Future.value(Left(Exception())));

    final result = await sut('');

    expect(result.isLeft(), true);
  });
}
