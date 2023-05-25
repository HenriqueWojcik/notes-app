import 'package:flutter/material.dart';

import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../domain/usecases/create_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';

class NewNoteController {
  final CreateNoteUseCase createNote;
  final EditNoteUsecase editNote;

  NewNoteController({
    required this.createNote,
    required this.editNote,
  });

  final createNoteState = AppState<void>();
  final noteState = AppState<Note?>();

  Note? note;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void init(Note? n) {
    if (n != null) {
      note = n;
      titleController.text = n.title ?? '';
      bodyController.text = n.body ?? '';
    } else {
      note = Note();
    }
  }

  Future<bool> createNewNote() async {
    bool? value;

    if (note?.id == null) {
      await createNoteState.update(() async {
        final result = await createNote(note);
        value = result.isLeft();

        return result;
      });
    } else {
      await createNoteState.update(() async {
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

  void dispose() {
    createNoteState.dispose();
    noteState.dispose();

    titleController.dispose();
    bodyController.dispose();
  }
}
