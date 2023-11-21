import 'package:flutter_notes_app/core/i18n/i18n.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/new_note/presentation/controller/new_note_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late NewNoteController sut;

  late MockGetNoteByIdUseCase getNoteById;
  late MockCreateNoteUseCase createNote;
  late MockEditNoteUsecase editNote;
  late MockDeleteNoteUseCase deleteNoteUseCase;

  setUp(() {
    getNoteById = MockGetNoteByIdUseCase();
    createNote = MockCreateNoteUseCase();
    editNote = MockEditNoteUsecase();
    deleteNoteUseCase = MockDeleteNoteUseCase();

    sut = NewNoteController(
      getNoteById: getNoteById,
      createNote: createNote,
      editNote: editNote,
      deleteNoteUseCase: deleteNoteUseCase,
    );
  });

  test('should init a note with title and body empty when noteId is null', () {
    sut.init(null);

    expect(sut.note?.title, '');
    expect(sut.note?.body, '');
  });

  test('should get a note by id when id is not null', () async {
    final Note note = NoteSample.sample();

    when(getNoteById(note.id)).thenAnswer((_) async => (null, note));

    await sut.init(note.id);

    expect(sut.note, note);
    expect(sut.titleController.text, note.title);
    expect(sut.bodyController.text, note.body);
    expect(
      sut.scaffoldState.onSuccessMessage,
      I18n.strings.noteEditedWithSuccess,
    );
  });

  test('should create a note correctly', () async {
    when(createNote(any)).thenAnswer((_) async => const (null, null));

    final value = await sut.createOrUpdateNote();

    expect(
      sut.scaffoldState.onSuccessMessage,
      I18n.strings.noteCreatedWithSuccess,
    );
    expect(value, true);
  });

  test('should update note correctly', () async {
    sut.note = NoteSample.sample();

    when(editNote(any)).thenAnswer((_) async => const (null, null));

    final value = await sut.createOrUpdateNote();
    expect(
      sut.scaffoldState.onSuccessMessage,
      I18n.strings.noteEditedWithSuccess,
    );
    expect(value, true);
  });

  test('should delete note correctly', () async {
    when(sut.deleteNoteUseCase(any))
        .thenAnswer((_) async => const (null, null));

    final value = await sut.deleteNote();

    expect(value, true);
  });

  test('should set title on note correctly', () {
    const title = 'title';

    sut.setTitle(title);

    expect(sut.note?.title, title);
  });

  test('should set body on note correctly', () {
    const body = 'body';

    sut.setBody(body);

    expect(sut.note?.body, body);
  });

  test('should set pinned on note correctly', () {
    sut.setPinned();

    expect(sut.note?.pinned, true);
  });

  test('should verify if states are dispose', () {
    sut.dispose();
    expect(sut.noteState.isDisposed, true);
    expect(sut.scaffoldState.isDisposed, true);
    // ignore: invalid_use_of_protected_member
    expect(sut.titleController.hasListeners, false);
    // ignore: invalid_use_of_protected_member
    expect(sut.bodyController.hasListeners, false);
  });
}
