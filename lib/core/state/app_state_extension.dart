import 'package:dartz/dartz.dart' hide Task;

import '../repositories/base_repository.dart';
import 'app_state.dart';

extension AppStateExtension<T> on AppState {
  Future<void> update(Task<Either<Exception, T>> task) async {
    onLoad();

    Either<Exception, T> result = await task();

    result.fold((l) => fail = l, (r) => value = r);
  }
}
