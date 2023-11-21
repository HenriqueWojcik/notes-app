import 'package:flutter_notes_app/core/entities/failure.dart';

import 'package:flutter_notes_app/features/home_page/data/models/note_model.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/new_note/data/repositories/new_note_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';
import '../../../../samples/models/note_model_sample.dart';

void main() {
  late NewNoteRepositoryImpl sut;
  late MockNewNoteDatasourceInterface datasource;

  setUp(() {
    datasource = MockNewNoteDatasourceInterface();
    sut = NewNoteRepositoryImpl(datasource: datasource);
  });

  test('should return a either Note correctly', () async {
    final NoteModel noteModel = NoteModelSample.sample;

    when(datasource.getNoteById(any)).thenAnswer((_) async => noteModel);

    final (Failure? failure, Note? data) = await sut.getNoteById('');

    expect(failure == null, true);
    expect(data, isA<Note>());
  });

  test('should return a either Exception when getNoteById fails', () async {
    when(datasource.getNoteById(any)).thenThrow(Exception());

    final (Failure? failure, Note? data) = await sut.getNoteById('');

    expect(data == null, true);
    expect(failure, isA<Failure>());
  });

  test('should return a either void correctly in createNote method', () async {
    final note = NoteSample.sample();

    when(datasource.createNote(any)).thenAnswer((_) async => {});

    final (Failure? failure, void _) = await sut.createNote(note);

    expect(failure == null, true);
  });

  test(
      'should return a either Exception when receive a note null in createNote method',
      () async {
    when(datasource.createNote(any)).thenThrow(Exception());

    final (Failure? failure, void _) = await sut.createNote(null);

    expect(failure != null, true);
    expect(failure, isA<Failure>());
  });

  test('should return a either void correctly in editNote method', () async {
    final note = NoteSample.sample();

    when(datasource.editNote(any)).thenAnswer((_) async => {});

    final (Failure? failure, void _) = await sut.editNote(note);

    expect(failure == null, true);
  });

  test(
      'should return a either Exception when receive a note null in editNote method',
      () async {
    when(datasource.editNote(any)).thenThrow(Exception());

    final (Failure? failure, void _) = await sut.editNote(null);

    expect(failure != null, true);
    expect(failure, isA<Failure>());
  });

  test('should return a either void correctly in deleteNote method', () async {
    final note = NoteSample.sample();

    when(datasource.deleteNote(any)).thenAnswer((_) async => true);

    final (Failure? falure, void _) = await sut.deleteNote(note);

    expect(falure == null, true);
  });

  test(
      'should return a either Exception when receive a note null in deleteNote method',
      () async {
    when(datasource.deleteNote(any)).thenThrow(Exception());

    final (Failure? failure, void _) = await sut.deleteNote(null);

    expect(failure != null, true);
    expect(failure, isA<Failure>());
  });
}
