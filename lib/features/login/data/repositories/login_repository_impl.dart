import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../injectors.dart';
import '../../domain/repositories/login_repository_interface.dart';
import '../datasources/login_datasource_interface.dart';

class LoginRepositoryImpl extends BaseRepository
    implements LoginRepositoryInterface {
  final LoginDatasourceInterface datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> loginWithGoogle() {
    return doAsync(() async {
      final user = await datasource.loginWithGoogle();

      Injectors.registerUser(user);
    });
  }
}
