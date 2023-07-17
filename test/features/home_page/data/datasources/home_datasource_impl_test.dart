import 'package:flutter_notes_app/features/home_page/data/datasources/home_datasource_impl.dart';
import 'package:flutter_notes_app/features/home_page/data/models/note_model.dart';
import 'package:flutter_notes_app/injectors.dart';
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
    MockUser mockUser = MockUser();
    when(mockUser.uid).thenReturn('123');

    Injectors.registerUser(mockUser);

    final json = await loadJsonFile('notes.json');

    when(mockCommunication.get(any)).thenAnswer((_) async => json);

    final result = await sut.getNotes();

    expect(result, isA<List<NoteModel>>());
    expect(result.length, 2);
  });
}
