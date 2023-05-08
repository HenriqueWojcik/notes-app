import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../domain/usecases/create_note_usecase.dart';

class NewNoteController {
  final CreateNoteUseCase createNote;

  NewNoteController({
    required this.createNote,
  });

  final createNoteState = AppState<void>();
  final noteState = AppState<Note>();

  final Note note = Note();

  Future<bool> createNewNote() async {
    bool? value;

    await createNoteState.update(() async {
      final result = await createNote(note);
      value = result.isLeft();

      return result;
    });

    return value ?? false;
  }

  void setTitle(String title) {
    editedAt();
    note.title = title;
    _update();
  }

  void setBody(String body) {
    editedAt();
    note.body = body;
    _update();
  }

  void setPinned() {
    editedAt();
    bool? pinned = note.pinned;

    note.pinned = pinned == null || pinned ? false : true;
    _update();
  }

  void editedAt() => note.editedAt = DateTime.now().toString();

  void _update() => noteState.value = note;

  void dispose() {
    createNoteState.dispose();
    noteState.dispose();
  }
}
