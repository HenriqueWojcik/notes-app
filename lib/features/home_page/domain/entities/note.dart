class Note {
  String? id;
  String title;
  String body;
  String? editedAt;
  bool? pinned;
  bool sync;

  Note({
    this.id,
    required this.title,
    required this.body,
    this.editedAt,
    this.pinned,
    this.sync = false,
  });
}
