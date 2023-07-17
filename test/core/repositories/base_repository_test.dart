import 'package:flutter_notes_app/core/repositories/base_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class BaseRepositoryTest extends BaseRepository {}

void main() {
  late BaseRepositoryTest sut;

  setUp(() {
    sut = BaseRepositoryTest();
  });

  test('return left when is success on the task', () async {
    int? value;
    Exception? error;

    final result = await sut.doAsync<int>(() async => 1);

    result.fold((l) => error = l, (r) => value = r);

    expect(result.isRight(), true);
    expect(value, 1);
    expect(error, null);
  });

  test(
    'return right when has erros on the task',
    () async {
      int? value;
      Exception? error;

      Exception exception = Exception();

      final result = await sut.doAsync<int>(() async => throw exception);

      result.fold((l) => error = l, (r) => value = r);

      expect(result.isLeft(), true);
      expect(value, null);
      expect(error, exception);
    },
  );
}
