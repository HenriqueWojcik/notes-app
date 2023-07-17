import 'package:flutter/material.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../../../core/state/scaffold_app_state.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../domain/usecases/create_note_usecase.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';
import '../../domain/usecases/get_note_by_id.dart';

class NewNoteController {
  final GetNoteById getNoteById;
  final CreateNoteUseCase createNote;
  final EditNoteUsecase editNote;
  final DeleteNoteUseCase deleteNoteUseCase;

  NewNoteController({
    required this.getNoteById,
    required this.createNote,
    required this.editNote,
    required this.deleteNoteUseCase,
  });

  final noteState = AppState<Note?>();

  final scaffoldState =
      ScaffoldAppState(onSuccessMessage: I18n.strings.noteCreatedWithSuccess);

  Note? note;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  bool get isEditingNote => note?.id != null;

  void init(String? noteId) {
    if (noteId == null) {
      note = Note(
        title: '',
        body: '',
      );
      return;
    }

    noteState.update(() async {
      return getNoteById(noteId);
    });

    getNoteById(noteId).then((result) {
      result.fold(
        (failure) => scaffoldState.onErrorMessage = failure.toString(),
        (note) {
          this.note = note;
          titleController.text = note.title;
          bodyController.text = note.body;
          scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
        },
      );
    });
  }

  Future<bool> createNewNote() async {
    bool? value;

    if (note?.id == null) {
      await scaffoldState.update(() async {
        final result = await createNote(note);
        value = result.isLeft();

        return result;
      });
    } else {
      scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
      await scaffoldState.update(() async {
        final result = await editNote(note);
        value = result.isLeft();

        return result;
      });
    }

    return value ?? false;
  }

  void setTitle(String title) {
    editedAt();
    note?.title = title;
    _update();
  }

  void setBody(String body) {
    editedAt();
    note?.body = body;
    _update();
  }

  void setPinned() {
    editedAt();
    bool? pinned = note?.pinned;

    note?.pinned = pinned == null || pinned ? false : true;
    _update();
  }

  void editedAt() => note?.editedAt = DateTime.now().toString();

  void _update() => noteState.value = note;

  Future<bool> deleteNote() async {
    bool? value;

    scaffoldState.onSuccessMessage = I18n.strings.noteRemovedWithSuccess;
    await scaffoldState.update(() async {
      final result = await deleteNoteUseCase.call(note);
      value = result.isLeft();

      return result;
    });

    return value ?? false;
  }

  void dispose() {
    noteState.dispose();

    scaffoldState.dispose();

    titleController.dispose();
    bodyController.dispose();
  }
}
