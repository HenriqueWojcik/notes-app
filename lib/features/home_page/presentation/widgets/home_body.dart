import 'package:flutter/material.dart';

import '../../../../core/state/app_state_builder.dart';
import '../../../../core/widgets/empty_placeholder.dart';
import '../controller/home_controller.dart';
import 'note_card.dart';

class HomeBody extends StatefulWidget {
  final HomeController controller;

  const HomeBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return AppStateBuilder(
      state: controller.notes,
      builder: (_, state) {
        if (state.loading) {
          return const CircularProgressIndicator();
        }

        final notes = state.data;

        if (notes == null || notes.isEmpty) {
          return const EmptyPlaceholder(
            message: 'no one notes find',
          );
        }

        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (_, idx) {
            return NoteCard(note: notes[idx]);
          },
        );
      },
    );
  }
}
