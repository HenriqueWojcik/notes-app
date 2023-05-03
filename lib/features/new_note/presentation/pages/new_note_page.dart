import 'package:flutter/material.dart';

import '../../../../core/widgets/note_app_bar.dart';
import '../../../home_page/domain/entities/note.dart';
import '../widgets/new_note_body.dart';

class NewNotePage extends StatefulWidget {
  final Note? note;

  const NewNotePage({
    super.key,
    this.note,
  });

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppBar(
        title: const Text('New Note'),
      ),
      body: const NewNoteBody(),
    );
  }
}
