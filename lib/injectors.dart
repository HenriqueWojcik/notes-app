import 'package:get_it/get_it.dart';

import 'core/data/communication_impl.dart';
import 'core/data/communication_inferface.dart';
import 'features/home_page/data/datasources/home_datasource_impl.dart';
import 'features/home_page/data/datasources/home_datasource_interface.dart';

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

  static void injectRepositories() {}

  static void injectUsecases() {}

  static void injectControllers() {}
}
