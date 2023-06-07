import '../../core/injector/feature_injector.dart';
import '../../injectors.dart';
import 'data/datasources/login_datasource_impl.dart';
import 'data/datasources/login_datasource_interface.dart';
import 'data/datasources/login_datasource_mock.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository_interface.dart';

class LoginInjector extends FeatureInjector {
  @override
  void injectDatasourcesImpl() {
    getIt.registerFactory<LoginDatasourceInterface>(
      () => LoginDatasourceImpl(firebaseHelper: getIt()),
    );
  }

  @override
  void injectDatasourcesMock() {
    getIt.registerFactory<LoginDatasourceInterface>(
      () => LoginDatasourceMock(),
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
    // TODO: implement injectUsecases
  }

  @override
  void injectControllers() {
    // TODO: implement injectControllers
  }
}
