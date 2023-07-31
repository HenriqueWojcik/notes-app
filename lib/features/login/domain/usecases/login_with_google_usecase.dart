import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../repositories/login_repository_interface.dart';

class LoginWithGoogleUsecase {
  final LoginRepositoryInterface repository;

  LoginWithGoogleUsecase({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.loginWithGoogle();
  }
}
