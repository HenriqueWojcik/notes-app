import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/models/note_model_sample.dart';

void main() {
  late HomeRepositoryImpl sut;
  late MockHomeDatasourceInterface homeDatasource;

  setUp(() {
    homeDatasource = MockHomeDatasourceInterface();
    sut = HomeRepositoryImpl(datasource: homeDatasource);
  });

  test('should return a notes list and a left-result from method', () async {
    final sample = NoteModelSample.sample;

    when(homeDatasource.getNotes()).thenAnswer((_) async => [sample]);

    final result = await sut.getNotes();

    late List<Note> list;
    result.fold((l) => null, (r) => list = r);

    expect(result.isLeft(), true);
    expect(list.length, 1);
  });

  test('should return a Exception and a right-result from method', () async {
    when(homeDatasource.getNotes()).thenThrow(Exception());

    final result = await sut.getNotes();

    expect(result.isRight(), true);
  });
}
