import 'package:flutter/material.dart';

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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> init() async {
    notes.update(() async {
      final value = await getNotes();

      _notes = value.asRight();

      return value;
    });
  }

  Future<void> update({bool? refresh = false}) async {
    if (refresh != null && refresh) {
      await init();
    }
  }

  void changeHomeViewState() {
    homeView.value =
        _homeViewState == HomeView.grid ? HomeView.list : HomeView.grid;
  }

  Future<void> onSearchNotes(String value) async {
    await notes.update(() => Future.value(searchNotes(_notes, value)));
  }

  void dispose() {
    notes.dispose();
    homeView.dispose();
  }
}
