import 'package:dartz/dartz.dart';

import 'app_state.dart';

extension AppStateExtension<T> on AppState {
  void update(Future<Either<T, Exception>> promisse) async {
    onLoad();

    final result = await promisse;
    result.fold((l) => value = l, (r) => fail = r);
  }
}
