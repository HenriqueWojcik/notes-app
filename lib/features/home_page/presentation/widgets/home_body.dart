import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/state/app_state_builder.dart';
import '../../../../core/widgets/empty_placeholder.dart';
import '../../domain/entities/note.dart';
import '../controller/home_controller.dart';
import 'grid_view_title.dart';
import 'home_grid_view.dart';

class HomeBody extends StatelessWidget {
  final HomeController controller;
  final Function(Note note) onClickNoteCard;

  const HomeBody({
    Key? key,
    required this.controller,
    required this.onClickNoteCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateBuilder(
      state: controller.notes,
      builder: (_, state) {
        final notes = state.data;

        if (notes == null || notes.isEmpty) {
          return EmptyPlaceholder(
            message: I18n.strings.noNotesFound,
          );
        }

        return AppStateBuilder(
          state: controller.homeView,
          builder: (_, howeView) {
            final notesPinned =
                notes.where((note) => note.pinned == true).toList();

            final notesNotPinned = notes
                .where((note) => note.pinned == false || note.pinned == null)
                .toList();

            final homeViewValue = howeView.data ?? HomeView.grid;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notesPinned.isNotEmpty) ...[
                    GridViewTitle(title: I18n.strings.pinned),
                    HomeGridView(
                      notes: notesPinned,
                      homeView: homeViewValue,
                      onClickNoteCard: onClickNoteCard,
                    ),
                  ],
                  if (notesNotPinned.isNotEmpty) ...[
                    GridViewTitle(title: I18n.strings.others),
                    HomeGridView(
                      notes: notesNotPinned,
                      homeView: homeViewValue,
                      onClickNoteCard: onClickNoteCard,
                    ),
                  ]
                ],
              ),
            );
          },
        );
      },
    );
  }
}
