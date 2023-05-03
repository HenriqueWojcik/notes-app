import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
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

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
