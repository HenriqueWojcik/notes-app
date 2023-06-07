import 'package:dartz/dartz.dart';

import '../../../../core/repositories/base_repository.dart';
import '../../domain/repositories/login_repository_interface.dart';
import '../datasources/login_datasource_interface.dart';

class LoginRepositoryImpl extends BaseRepository
    implements LoginRepositoryInterface {
  final LoginDatasourceInterface datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<Either<Exception, void>> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
