import 'package:dartz/dartz.dart';
import 'package:flutter_notes_app/core/entities/failure.dart';
import 'package:flutter_notes_app/core/enums/home_view.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/presentation/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late HomeController sut;
  late MockGetNotesUsecase getNotes;
  late MockSearchNotesUsecase searchNotes;

  setUp(() {
    getNotes = MockGetNotesUsecase();
    searchNotes = MockSearchNotesUsecase();

    sut = HomeController(
      getNotes: getNotes,
      searchNotes: searchNotes,
    );
  });

  test(
      'should check that the notes state is updated with the result of the getNotes usecase ',
      () async {
    final Either<Failure, List<Note>> result = Right([
      NoteSample.sample(),
      NoteSample.sample(),
    ]);

    when(getNotes()).thenAnswer((_) async => result);

    await sut.init();

    verify(getNotes()).called(1);
    expect(sut.notes.hasData, true);
  });

  test('should refresh notes when refresh value is true', () async {
    final Either<Failure, List<Note>> result = Right([
      NoteSample.sample(),
      NoteSample.sample(),
    ]);

    when(getNotes()).thenAnswer((_) async => result);

    await sut.update(refresh: true);

    verify(getNotes()).called(1);
    expect(sut.notes.hasData, true);
  });

  test('should not refresh note when refresh value is false', () async {
    await sut.update(refresh: false);

    verifyNever(getNotes());
  });

  test('should change homeView corretly', () {
    sut.changeHomeViewState();

    expect(sut.homeView.data, HomeView.list);

    sut.changeHomeViewState();

    expect(sut.homeView.data, HomeView.grid);
  });

  test('should search notes corretly', () async {
    final Either<Failure, List<Note>> result = Right([
      NoteSample.sample(),
      NoteSample.sample(),
    ]);

    when(searchNotes(any, any)).thenReturn(result);

    await sut.onSearchNotes('title');

    expect(sut.notes.hasData, true);
    expect(sut.notes.data?.length, 2);
  });

  test('should dispose notes and homeView', () {
    sut.dispose();

    expect(sut.notes.isDisposed, true);
    expect(sut.homeView.isDisposed, true);
  });
}
