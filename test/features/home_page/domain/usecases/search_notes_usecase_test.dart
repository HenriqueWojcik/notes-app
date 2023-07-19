import 'package:flutter_notes_app/core/helpers/dart_z_externsion.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/domain/usecases/search_notes_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late SearchNotesUsecase sut;

  setUp(() {
    sut = SearchNotesUsecase();
  });

  test('should return an empty note list', () async {
    final List<Note> list = [];
    final result = sut(list, '');

    expect(result.asRight(), list);
  });

  test(
    'should return all item where constains the value',
    () {
      final List<Note> list = [
        NoteSample.sample(),
        NoteSample.sample(),
        NoteSample.sample(),
      ];

      final result = sut(list, 'title');

      expect(result.asRight(), list);
      expect(result.asRight()?.length, 3);
    },
  );

  test(
    'should return all item where constains the value',
    () {
      final List<Note> list = [
        NoteSample.sample(),
        NoteSample.sample(),
        NoteSample.sample(),
      ];

      final result = sut(list, 'title');

      expect(result.asRight(), list);
      expect(result.asRight()?.length, 3);
    },
  );
}
