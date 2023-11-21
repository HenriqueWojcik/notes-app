import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/models/note_model_sample.dart';

void main() {
  late HomeRepositoryImpl sut;
  late MockHomeDatasourceInterface homeDatasource;
  late MockHomeErrorHandler homeErrorHandler;

  setUp(() {
    homeDatasource = MockHomeDatasourceInterface();
    homeErrorHandler = MockHomeErrorHandler();
    sut = HomeRepositoryImpl(
      datasource: homeDatasource,
      homeErrorHandler: homeErrorHandler,
    );
  });

  test('should return a notes list and a right-result from method', () async {
    final sample = NoteModelSample.sample;

    when(homeDatasource.getNotes()).thenAnswer((_) async => [sample]);

    final (Failure? _, List<Note>? notes) = await sut.getNotes();

    expect(notes?.isNotEmpty, true);
    expect(notes?.length, 1);
  });

  test('should return a Exception and a left-result from method', () async {
    when(homeDatasource.getNotes()).thenThrow(Exception());

    final (Failure? failure, List<Note>? _) = await sut.getNotes();

    expect(failure?.message.isNotEmpty, true);
  });
}
