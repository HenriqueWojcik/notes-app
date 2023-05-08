import 'package:flutter/material.dart';

import '../../domain/entities/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(note.title ?? ''),
          Text(note.body ?? ''),
        ],
      ),
    );
  }
}
