import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/state/app_state_builder.dart';
import '../../../../core/widgets/empty_placeholder.dart';
import '../../domain/entities/note.dart';
import '../controller/home_controller.dart';
import 'note_card.dart';

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
          return const EmptyPlaceholder(
            message: 'no one notes find',
          );
        }

        return AppStateBuilder(
          state: controller.homeView,
          builder: (_, howeView) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: howeView.data == HomeView.grid ? 2 : 1,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: notes.length,
              itemBuilder: (_, idx) {
                return NoteCard(
                  note: notes[idx],
                  onClickNoteCard: onClickNoteCard,
                );
              },
            );
          },
        );
      },
    );
  }
}
