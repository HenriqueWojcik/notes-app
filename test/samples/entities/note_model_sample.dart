import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';

extension NoteSample on Note {
  static Note get sample => Note(
        title: 'title',
        body: 'body',
        editedAt: '',
        pinned: false,
        sync: false,
      );
}
