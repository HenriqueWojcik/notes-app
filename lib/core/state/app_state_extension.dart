import 'package:dartz/dartz.dart' hide Task;

import '../entities/failure.dart';
import '../repositories/base_repository.dart';
import 'app_state.dart';

extension AppStateExtension<T> on AppState {
  Future<void> update(Task<Either<Failure, T>> task) async {
    onLoad();

    Either<Failure, T> result = await task();

    result.fold((l) => fail = l, (r) => value = r);
  }
}
