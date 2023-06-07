import 'package:dartz/dartz.dart';

import '../repositories/login_repository_interface.dart';

class LoginWithGoogleUseCase {
  final LoginRepositoryInterface repository;

  LoginWithGoogleUseCase({required this.repository});

  Future<Either<Exception, void>> call() async {
    return await repository.loginWithGoogle();
  }
}
