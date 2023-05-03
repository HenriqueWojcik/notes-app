import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../../home_page/domain/entities/note.dart';
import '../../domain/usecases/create_note.dart';

class NewNoteController {
  final CreateNote createNote;

  NewNoteController({
    required this.createNote,
  });

  final createNoteState = AppState<void>();

  Future<void> createNewNote(Note note) async {
    createNoteState.update(createNote(note));
  }

  void dispose() {
    createNoteState.dispose();
  }
}
