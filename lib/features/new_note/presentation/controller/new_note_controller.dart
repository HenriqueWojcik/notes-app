import 'package:flutter/material.dart';
import 'package:my_foundation/main.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../domain/usecases/create_note_usecase.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/edit_note_usecase.dart';
import '../../domain/usecases/get_note_by_id.dart';

class NewNoteController {
  final GetNoteByIdUseCase getNoteById;
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  bool get isEditingNote => note?.id != null;

  Future<void> init(String? noteId) async {
    if (noteId == null) {
      _createNoteIfNotExists();
      return;
    }

    await noteState.update(() async {
      final (Failure? failure, Note? data) = await getNoteById(noteId);

      if (data != null) {
        note = data;
        titleController.text = data.title;
        bodyController.text = data.body;
        scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
      }

      return (failure, data);
    });
  }

  Future<bool> createOrUpdateNote() async {
    if (!validateForm()) {
      return false;
    }

    bool? value;

    Future<(Failure?, void)> task() async {
      if (isEditingNote) {
        scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
        return editNote(note);
      }

      return createNote(note);
    }

    await scaffoldState.update(() async {
      final (Failure? failure, void data) v = await task();
      value = v.$1 == null;

      return v;
    });

    return value ?? false;
  }

  void setTitle(String title) {
    _createNoteIfNotExists();
    _editedAt();

    note?.title = title;
    _updateState();
  }

  void setBody(String body) {
    _createNoteIfNotExists();
    _editedAt();

    note?.body = body;
    _updateState();
  }

  void setPinned() {
    _createNoteIfNotExists();
    _editedAt();

    bool? pinned = note?.pinned;

    note?.pinned = pinned == null ? true : !pinned;
    _updateState();
  }

  void _editedAt() => note?.editedAt = DateTime.now().toString();

  void _updateState() => noteState.value = note;

  void _createNoteIfNotExists() {
    note ??= Note(
      title: '',
      body: '',
    );
  }

  Future<bool> deleteNote() async {
    bool? value;

    scaffoldState.onSuccessMessage = I18n.strings.noteRemovedWithSuccess;
    await scaffoldState.update(() async {
      final (Failure? failure, void data) v = await deleteNoteUseCase(note);

      value = v.$1 == null;

      return v;
    });

    return value ?? false;
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void dispose() {
    noteState.dispose();

    scaffoldState.dispose();

    titleController.dispose();
    bodyController.dispose();
  }
}
