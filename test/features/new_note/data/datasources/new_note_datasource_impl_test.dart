import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notes_app/features/home_page/data/models/note_model.dart';
import 'package:flutter_notes_app/features/new_note/data/datasources/new_note_datasource_impl.dart';
import 'package:flutter_notes_app/injectors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/load_json_files.dart';
import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/models/note_model_sample.dart';

void main() {
  late NewNoteDatasourceImpl sut;
  late MockCommunicationInterface communication;
  late MockUser user;

  setUp(() {
    communication = MockCommunicationInterface();
    sut = NewNoteDatasourceImpl(communication: communication);
    user = MockUser();

    getIt.registerLazySingleton<User>(() => user);
  });

  tearDown(() {
    getIt.reset();
  });

  test('should return note by id correctly', () async {
    const String id = '';

    when(communication.get(any))
        .thenAnswer((_) async => await loadJsonFile('notes.json'));

    final value = await sut.getNoteById(id);

    expect(value, isA<NoteModel>());
  });

  test('should create a note successfully', () async {
    final noteModel = NoteModelSample.sample;

    when(communication.post(any)).thenAnswer((_) async => {'id': ''});

    expect(() async => await sut.createNote(noteModel), isA<void>());
  });

  test('should throw a Exception when something fails to create a note',
      () async {
    const String id = '';

    when(user.uid).thenAnswer((_) => id);
    when(communication.post(any)).thenAnswer((_) async => {});

    final noteModel = NoteModelSample.sample;
    noteModel.userId = id;

    await expectLater(
      () async => await sut.createNote(noteModel),
      throwsException,
    );
  });

  test('should edit note correctly', () {
    final noteModel = NoteModelSample.sample;

    when(communication.put(any)).thenAnswer((_) async => {});

    expect(
      () async => await sut.editNote(
        noteModel,
      ),
      isA<void>(),
    );
  });

  test('should delete note correctly', () async {
    final noteModel = NoteModelSample.sample;

    when(communication.delete(any)).thenAnswer((_) async => true);

    final result = await sut.deleteNote(
      noteModel,
    );

    expect(result, true);
  });
}
