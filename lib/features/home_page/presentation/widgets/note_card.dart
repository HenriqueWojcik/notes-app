import 'package:flutter/material.dart';

import '../../domain/entities/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function(Note note) onClickNoteCard;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onClickNoteCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClickNoteCard(note),
      child: Card(
        child: Column(
          children: [
            Text(note.title ?? ''),
            Text(note.body ?? ''),
          ],
        ),
      ),
    );
  }
}
