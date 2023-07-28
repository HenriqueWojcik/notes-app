import 'package:dartz/dartz.dart';
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

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  bool get isEditingNote => note?.id != null;

  Future<void> init(String? noteId) async {
    if (noteId == null) {
      _createNoteIfNotExists();
      return;
    }

    await noteState.update(() async {
      final result = await getNoteById(noteId);

      result.fold((_) => null, (value) {
        note = value;
        titleController.text = value.title;
        bodyController.text = value.body;
        scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
      });

      return result;
    });
  }

  Future<bool> createOrUpdateNote() async {
    bool? value;

    Future<Either<Exception, void>> task() async {
      if (isEditingNote) {
        scaffoldState.onSuccessMessage = I18n.strings.noteEditedWithSuccess;
        return editNote(note);
      }

      return createNote(note);
    }

    await scaffoldState.update(() async {
      final result = await task();
      value = result.isRight();

      return result;
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
      final result = await deleteNoteUseCase(note);
      value = result.isRight();

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
