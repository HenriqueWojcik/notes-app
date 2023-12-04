import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/usecases/search_notes_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_foundation/main.dart';

import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late SearchNotesUsecase sut;

  setUp(() {
    sut = SearchNotesUsecase();
  });

  test('should return an empty note list', () async {
    final List<Note> list = [];
    final (Failure? _, List<Note>? notes) = sut(list, '');

    expect(notes, list);
  });

  test(
    'should return all item where constains the value',
    () {
      final List<Note> list = [
        NoteSample.sample(),
        NoteSample.sample(),
        NoteSample.sample(),
      ];

      final (Failure? _, List<Note>? notes) = sut(list, '');

      expect(notes, list);
      expect(notes?.length, 3);
    },
  );
}
