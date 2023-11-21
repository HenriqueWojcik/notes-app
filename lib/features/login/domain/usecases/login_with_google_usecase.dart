import '../../../../core/entities/failure.dart';
import '../repositories/login_repository_interface.dart';

class LoginWithGoogleUsecase {
  final LoginRepositoryInterface repository;

  LoginWithGoogleUsecase({required this.repository});

  Future<(Failure?, void)> call() async {
    return await repository.loginWithGoogle();
  }
}
