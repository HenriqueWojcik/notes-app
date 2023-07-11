import 'package:dartz/dartz.dart';

import '../repositories/login_repository_interface.dart';

class LoginWithGoogleUsecase {
  final LoginRepositoryInterface repository;

  LoginWithGoogleUsecase({required this.repository});

  Future<Either<Exception, void>> call() async {
    return await repository.loginWithGoogle();
  }
}
