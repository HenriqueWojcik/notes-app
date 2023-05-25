import 'package:flutter_notes_app/features/home_page/data/models/note_model.dart';

extension NoteModelSample on NoteModel {
  static NoteModel get sample => NoteModel(
        title: 'title',
        body: 'description',
        editedAt: '',
        pinned: true,
        sync: false,
      );
}
