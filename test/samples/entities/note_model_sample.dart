import 'package:faker/faker.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';

extension NoteSample on Note {
  static Note sample() {
    final faker = Faker();
    return Note(
      id: faker.guid.guid(),
      title: 'title',
      body: 'body',
      editedAt: '',
      pinned: false,
      sync: false,
    );
  }
}
