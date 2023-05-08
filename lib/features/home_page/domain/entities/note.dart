class Note {
  String? title;
  String? body;
  String? editedAt;
  bool? pinned;
  bool sync;

  Note({
    this.title,
    this.body,
    this.editedAt,
    this.pinned,
    this.sync = false,
  });
}
