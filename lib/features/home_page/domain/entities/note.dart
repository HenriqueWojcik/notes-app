class Note {
  String title;
  String body;
  String editedAt;
  bool pinned;
  bool sync;

  Note({
    required this.title,
    required this.body,
    required this.editedAt,
    required this.pinned,
    this.sync = false,
  });
}
