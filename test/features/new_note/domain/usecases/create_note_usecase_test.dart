import 'package:flutter_notes_app/features/new_note/domain/usecases/create_note_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_foundation/main.dart';

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
        .thenAnswer((_) => Future.value(const (null, null)));

    final (Failure? failure, void _) = await sut(NoteSample.sample());

    expect(failure == null, true);
  });

  test('should return correctly a right either correctly', () async {
    final error = Failure(message: '', title: '');
    when(repository.createNote(any))
        .thenAnswer((_) => Future.value((error, null)));

    final (Failure? failure, void _) = await sut(NoteSample.sample());

    expect(failure != null, true);
    expect(failure?.message, error.message);
  });
}
