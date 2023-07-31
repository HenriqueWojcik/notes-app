import '../../core/injector/feature_injector.dart';
import '../../injectors.dart';
import 'data/datasources/login_datasource_impl.dart';
import 'data/datasources/login_datasource_interface.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/login_with_google_usecase.dart';
import 'presentation/controller/login_controller.dart';

class LoginInjector extends FeatureInjector {
  @override
  void injectExceptionHandler() {
    // TODO: implement injectExceptionHandler
  }

  @override
  void injectDatasourcesImpl() {
    getIt.registerFactory<LoginDatasourceInterface>(
      () => LoginDatasourceImpl(firebaseHelper: getIt()),
    );
  }

  @override
  void injectDatasourcesMock() {
    getIt.registerFactory<LoginDatasourceInterface>(
      () => LoginDatasourceImpl(firebaseHelper: getIt()),
    );
  }

  @override
  void injectRepositories() {
    getIt.registerFactory<LoginRepositoryInterface>(
      () => LoginRepositoryImpl(datasource: getIt()),
    );
  }

  @override
  void injectUsecases() {
    getIt.registerFactory(() => LoginWithGoogleUsecase(repository: getIt()));
  }

  @override
  void injectControllers() {
    getIt.registerFactory(() => LoginController(loginWithGoogle: getIt()));
  }
}
