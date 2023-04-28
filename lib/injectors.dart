import 'package:get_it/get_it.dart';

import 'core/data/communication_impl.dart';
import 'core/data/communication_inferface.dart';
import 'features/home_page/data/datasources/home_datasource_impl.dart';
import 'features/home_page/data/datasources/home_datasource_interface.dart';
import 'features/home_page/data/repositories/home_repository_interface.dart';
import 'features/home_page/domain/repositories/home_repository_impl.dart';
import 'features/home_page/domain/usecases/get_notes_usecase.dart';
import 'features/home_page/presentation/bloc/home_controller.dart';

GetIt get getIt => GetIt.I;

class Injectors {
  static void inject() {
    injectSingletons();
    injectDatasources();
    injectRepositories();
    injectUsecases();
    injectControllers();
  }

  static void injectSingletons() {
    getIt.registerLazySingleton<CommunicationInterface>(
      () => CommunicationImpl(),
    );
  }

  static void injectDatasources() {
    getIt.registerFactory<HomeDatasourceInterface>(
      () => HomeDatasourceImpl(communication: getIt()),
    );
  }

  static void injectRepositories() {
    getIt.registerFactory<HomeRepositoryInterface>(
      () => HomeRepositoryImpl(datasource: getIt()),
    );
  }

  static void injectUsecases() {
    getIt.registerFactory(() => GetNotesUsecase(repository: getIt()));
  }

  static void injectControllers() {
    getIt.registerFactory(() => HomeController(getNotes: getIt()));
  }
}
