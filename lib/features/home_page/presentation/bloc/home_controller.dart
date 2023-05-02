import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes_usecase.dart';

class HomeController {
  final GetNotesUsecase getNotes;

  HomeController({required this.getNotes});

  final notes = AppState<List<Note>>();

  Future<void> init() async {
    notes.update(getNotes.call());
  }

  void dispose() {
    notes.dispose();
  }
}
