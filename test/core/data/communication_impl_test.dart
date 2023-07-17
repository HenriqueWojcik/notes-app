import 'package:flutter_notes_app/core/data/communication_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mocks.mocks.dart';

void main() {
  late CommunicationImpl sut;
  late MockFirebaseFirestore mockFirebase;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockRequest mockRequest;

  setUp(() {
    mockFirebase = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();
    mockQuerySnapshot = MockQuerySnapshot();
    mockDocumentReference = MockDocumentReference();
    mockRequest = MockRequest();
    sut = CommunicationImpl(firebase: mockFirebase);
  });

  void setupSuccess() {
    when(mockFirebase.collection(any)).thenReturn(mockCollectionReference);
    when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
    when(mockFirebase.doc(any)).thenReturn(mockDocumentReference);

    when(mockCollectionReference.get())
        .thenAnswer((_) async => mockQuerySnapshot);

    when(mockQuerySnapshot.docs).thenAnswer((_) => []);
  }

  test('should return an empty list of maps<string, dynamic> succefully ',
      () async {
    final List<Map<String, dynamic>> map = [];
    setupSuccess();

    when(mockRequest.collection).thenReturn('');
    when(mockRequest.parameters).thenReturn(null);

    final result = await sut.get(mockRequest);
    expect(map, result);
  });
}
