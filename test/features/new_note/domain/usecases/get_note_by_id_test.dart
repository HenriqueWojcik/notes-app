import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/new_note/domain/usecases/get_note_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late GetNoteByIdUseCase sut;
  late MockNewNoteRepositoryInterface repository;

  setUp(() {
    repository = MockNewNoteRepositoryInterface();
    sut = GetNoteByIdUseCase(repository: repository);
  });

  test('should return correctly a right either correctly', () async {
    final n = NoteSample.sample();
    when(repository.getNoteById(any))
        .thenAnswer((_) => Future.value((null, n)));

    final (Failure? _, Note? note) = await sut('');

    expect(note != null, true);
  });

  test('should return correctly a right either correctly', () async {
    final error = Failure(message: '');
    when(repository.getNoteById(any))
        .thenAnswer((_) => Future.value((error, null)));

    final (Failure? failure, Note? _) = await sut('');

    expect(failure != null, true);
  });
}
