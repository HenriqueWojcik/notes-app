import '../../../../core/enums/home_view.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/state/app_state_extension.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes_usecase.dart';

class HomeController {
  final GetNotesUsecase getNotes;

  HomeController({
    required this.getNotes,
  });

  final notes = AppState<List<Note>>();
  final homeView = AppState<HomeView>.init(HomeView.grid);

  HomeView get _homeViewState => homeView.data ?? HomeView.grid;

  Future<void> init() async {
    notes.update(getNotes);
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

  void dispose() {
    notes.dispose();
    homeView.dispose();
  }
}
