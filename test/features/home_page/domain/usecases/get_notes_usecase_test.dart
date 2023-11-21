import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/usecases/get_notes_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late GetNotesUsecase sut;
  late MockHomeRepositoryInterface repository;

  setUp(() {
    repository = MockHomeRepositoryInterface();
    sut = GetNotesUsecase(repository: repository);
  });

  test('should return notes correctly', () async {
    List<Note> value = [NoteSample.sample()];

    when(repository.getNotes()).thenAnswer((_) async => (null, value));

    final (Failure? _, List<Note>? notes) = await sut();

    expect(notes, value);
  });

  test('should return a Exception when datasource fails', () async {
    final Failure error = Failure(message: '');

    when(repository.getNotes()).thenAnswer((_) async => (error, null));

    final (Failure? failure, List<Note>? _) = await sut();

    expect(failure, error);
  });
}
