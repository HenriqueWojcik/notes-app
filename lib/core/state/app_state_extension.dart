import 'package:dartz/dartz.dart' hide Task;

import '../repositories/base_repository.dart';
import 'app_state.dart';

extension AppStateExtension<T> on AppState {
  Future<void> update(Task<Either<T, Exception>> task) async {
    onLoad();

    Either<T, Exception> result = await task();

    result.fold((l) => value = l, (r) => fail = r);
  }
}
