import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../domain/entities/note.dart';
import 'note_card.dart';

class HomeGridView extends StatelessWidget {
  final List<Note> notes;
  final HomeView homeView;
  final Function(Note note) onClickNoteCard;

  const HomeGridView({
    super.key,
    required this.notes,
    required this.homeView,
    required this.onClickNoteCard,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: homeView == HomeView.grid ? 2 : 1,
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
  }
}
