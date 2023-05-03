// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      title: json['title'] as String,
      body: json['body'] as String,
      editedAt: json['editedAt'] as String,
      pinned: json['pinned'] as bool,
      sync: json['sync'] as bool? ?? false,
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'editedAt': instance.editedAt,
      'pinned': instance.pinned,
      'sync': instance.sync,
    };
