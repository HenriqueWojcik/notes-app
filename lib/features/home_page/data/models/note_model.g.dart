// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      editedAt: json['editedAt'] as String?,
      pinned: json['pinned'] as bool?,
      sync: json['sync'] as bool? ?? false,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'editedAt': instance.editedAt,
      'pinned': instance.pinned,
      'sync': instance.sync,
      'userId': instance.userId,
    };
