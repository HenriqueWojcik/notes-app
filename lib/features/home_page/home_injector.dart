import '../../core/injector/feature_injector.dart';
import '../../injectors.dart';
import 'data/datasources/home_datasource_impl.dart';
import 'data/datasources/home_datasource_interface.dart';
import 'data/datasources/home_datasource_mock.dart';
import 'data/error/home_error_handler.dart';
import 'data/repositories/home_repository_interface.dart';
import 'domain/repositories/home_repository_impl.dart';
import 'domain/usecases/get_notes_usecase.dart';
import 'domain/usecases/search_notes_usecase.dart';
import 'presentation/controller/home_controller.dart';

class HomeInjector extends FeatureInjector {
  @override
  void injectExceptionHandler() {
    getIt.registerFactory<HomeErrorHandler>(
      () => HomeErrorHandler(),
    );
  }

  @override
  void injectDatasourcesImpl() {
    getIt.registerFactory<HomeDatasourceInterface>(
      () => HomeDatasourceImpl(communication: getIt()),
    );
  }

  @override
  void injectDatasourcesMock() {
    getIt.registerFactory<HomeDatasourceInterface>(
      () => HomeDatasourceMock(),
    );
  }

  @override
  void injectRepositories() {
    getIt.registerFactory<HomeRepositoryInterface>(
      () => HomeRepositoryImpl(datasource: getIt(), homeErrorHandler: getIt()),
    );
  }

  @override
  void injectUsecases() {
    getIt
      ..registerFactory(() => GetNotesUsecase(repository: getIt()))
      ..registerFactory(() => SearchNotesUsecase());
  }

  @override
  void injectControllers() {
    getIt.registerFactory(
      () => HomeController(getNotes: getIt(), searchNotes: getIt()),
    );
  }
}
