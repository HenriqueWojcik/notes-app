import '../../domain/entities/note.dart';
import '../models/note_model.dart';

class NoteMappper {
  static Note toEntity(NoteModel noteModel) {
    return Note(
      title: noteModel.title,
      body: noteModel.body,
      editedAt: noteModel.editedAt,
      pinned: noteModel.pinned,
    );
  }

  static List<Note> toEntityList(List<NoteModel> noteModels) {
    return noteModels.map((e) => toEntity(e)).toList();
  }

  static NoteModel toModel(Note note) {
    return NoteModel(
      title: note.title,
      body: note.body,
      editedAt: note.editedAt,
      pinned: note.pinned,
    );
  }
}
