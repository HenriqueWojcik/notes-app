import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/state/app_state_builder.dart';
import '../../../../core/widgets/empty_placeholder.dart';
import '../controller/home_controller.dart';
import 'note_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.controller});

  final HomeController controller;

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
                return NoteCard(note: notes[idx]);
              },
            );
          },
        );
      },
    );
  }
}
