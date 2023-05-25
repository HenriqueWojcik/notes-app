import 'package:flutter_notes_app/features/home_page/data/datasources/home_datasource_impl.dart';
import 'package:flutter_notes_app/features/home_page/data/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/load_json_files.dart';
import '../../../../mock/mocks.mocks.dart';

void main() {
  late HomeDatasourceImpl sut;
  late MockCommunicationInterface mockCommunication;

  setUp(() {
    mockCommunication = MockCommunicationInterface();
    sut = HomeDatasourceImpl(communication: mockCommunication);
  });

  test('should return list of notes corretly', () async {
    final json = await loadJsonFile('notes.json');

    List<Map<String, dynamic>> notes = json['notes'];

    when(mockCommunication.get(any)).thenAnswer((_) async => notes);

    final result = await sut.getNotes();

    expect(result, isA<List<NoteModel>>());
    expect(result.length, 2);
  });
}
