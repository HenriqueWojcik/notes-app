import '../../../../core/enums/home_view.dart';
import '../../../../core/helpers/dart_z_externsion.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes_usecase.dart';
import '../../domain/usecases/search_notes_usecase.dart';

class HomeController {
  final GetNotesUsecase getNotes;
  final SearchNotesUsecase searchNotes;

  HomeController({
    required this.getNotes,
    required this.searchNotes,
  });

  final notes = AppState<List<Note>>();
  final homeView = AppState<HomeView>.init(HomeView.grid);

  HomeView get _homeViewState => homeView.data ?? HomeView.grid;

  List<Note> _notes = [];

  Future<void> init() async {
    notes.update(() async {
      final value = await getNotes();

      _notes = value.asLeft();

      return value;
    });
  }

  void update({bool? refresh = false}) {
    if (refresh != null && refresh) {
      init();
    }
  }

  void changeHomeViewState() {
    homeView.value =
        _homeViewState == HomeView.grid ? HomeView.list : HomeView.grid;
  }

  void onSearchNotes(String value) {
    notes.update(() => Future.value(searchNotes(_notes, value)));
  }

  void dispose() {
    notes.dispose();
    homeView.dispose();
  }
}
