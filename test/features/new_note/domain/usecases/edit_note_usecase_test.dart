import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/edit_note_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late EditNoteUsecase sut;
  late MockNewNoteRepositoryInterface repository;

  setUp(() {
    repository = MockNewNoteRepositoryInterface();
    sut = EditNoteUsecase(repository: repository);
  });

  test('should return correctly a right either correctly', () async {
    when(repository.editNote(any))
        .thenAnswer((_) => Future.value(const (null, null)));

    final (Failure? failure, void _) = await sut(NoteSample.sample());

    expect(failure == null, true);
  });

  test('should return correctly a right either correctly', () async {
    final error = Failure(message: '');
    when(repository.editNote(any))
        .thenAnswer((_) => Future.value((error, null)));

    final (Failure? failure, void _) = await sut(NoteSample.sample());

    expect(failure != null, true);
  });
}
