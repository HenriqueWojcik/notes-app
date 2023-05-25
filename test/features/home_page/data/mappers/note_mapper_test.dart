import 'package:flutter_notes_app/features/home_page/data/mappers/note_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../samples/entities/note_model_sample.dart';
import '../../../../samples/models/note_model_sample.dart';

void main() {
  test('should return a entity in toEntity method', () {
    final model = NoteModelSample.sample;

    final entity = NoteMappper.toEntity(model);

    expect(model.title, entity.title);
    expect(model.body, entity.body);
    expect(model.editedAt, entity.editedAt);
    expect(model.pinned, entity.pinned);
    expect(model.sync, entity.sync);
  });

  test('should return a entity list in toEntityList method', () {
    final model = NoteModelSample.sample;

    final entityList = NoteMappper.toEntityList([model]);

    expect(entityList.length, 1);
    expect(model.title, entityList.first.title);
    expect(model.body, entityList.first.body);
    expect(model.editedAt, entityList.first.editedAt);
    expect(model.pinned, entityList.first.pinned);
    expect(model.sync, entityList.first.sync);
  });

  test('should return a model in toModel method', () {
    final entity = NoteSample.sample;

    final model = NoteMappper.toModel(entity);

    expect(entity.title, model.title);
    expect(entity.body, model.body);
    expect(entity.editedAt, model.editedAt);
    expect(entity.pinned, model.pinned);
    expect(entity.sync, model.sync);
  });
}
