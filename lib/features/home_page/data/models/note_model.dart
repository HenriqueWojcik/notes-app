class NoteModel {
  String title;
  String body;
  String editedAt;
  bool pinned;
  bool sync;

  NoteModel({
    required this.title,
    required this.body,
    required this.editedAt,
    required this.pinned,
    this.sync = false,
  });
}
