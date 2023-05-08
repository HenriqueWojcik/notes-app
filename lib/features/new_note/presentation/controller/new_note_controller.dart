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

  Future<void> createNewNote() async {
    createNoteState.update(createNote(note));
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
