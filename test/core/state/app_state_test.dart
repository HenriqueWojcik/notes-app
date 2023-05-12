import 'package:flutter_notes_app/core/state/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppState sut;

  setUp(() => sut = AppState());

  test(
      'when call onLoad method, should loading set true and value, erros set as null',
      () async {
    sut.onLoad();

    expect(sut.loading, true);
    expect(sut.data, null);
    expect(sut.error, null);
  });

  test(
      'when call set value, should have data and loading set false and error as null',
      () async {
    const int value = 1;
    sut.value = value;

    expect(sut.data, value);
    expect(sut.loading, false);
    expect(sut.error, null);
  });

  test(
      'when call set error, should have error and loading set false and data as null',
      () async {
    final Exception exception = Exception();
    sut.fail = exception;

    expect(sut.error, exception);
    expect(sut.data, null);
    expect(sut.loading, false);
  });

  test('should initialize app state corretly', () {
    const int value = 1;
    sut = AppState.init(value);

    expect(sut.data, value);
    expect(sut.loading, false);
    expect(sut.error, null);
  });
}
