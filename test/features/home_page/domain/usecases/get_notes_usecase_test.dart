import 'package:dartz/dartz.dart';
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
    Either<Exception, List<Note>> value = Right([NoteSample.sample()]);

    when(repository.getNotes()).thenAnswer((_) async => value);

    final result = await sut();

    expect(result, value);
  });

  test('should return a Exception when datasource fails', () async {
    Either<Exception, List<Note>> value = Left(Exception());

    when(repository.getNotes()).thenAnswer((_) async => value);

    final result = await sut();

    expect(result, value);
  });
}
