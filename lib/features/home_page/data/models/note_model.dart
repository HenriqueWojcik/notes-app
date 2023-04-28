class NoteModel {
  String title;
  String body;
  String editedAt;
  bool pinned;

  NoteModel({
    required this.title,
    required this.body,
    required this.editedAt,
    required this.pinned,
  });
}
