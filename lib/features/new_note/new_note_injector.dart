import '../../core/injector/feature_injector.dart';
import '../../injectors.dart';
import 'data/datasources/new_note_datasource_impl.dart';
import 'data/datasources/new_note_datasource_interface.dart';
import 'data/datasources/new_note_datasource_mock.dart';
import 'data/repositories/new_note_repository_interface.dart';
import 'domain/repositories/new_note_repository_impl.dart';
import 'domain/usecases/create_note_usecase.dart';
import 'domain/usecases/edit_note_usecase.dart';
import 'presentation/controller/new_note_controller.dart';

class NewNoteInjector extends FeatureInjector {
  @override
  void injectDatasourcesImpl() {
    getIt.registerFactory<NewNoteDatasourceInterface>(
      () => NewNoteDatasourceImpl(communication: getIt()),
    );
  }

  @override
  void injectDatasourcesMock() {
    getIt.registerFactory<NewNoteDatasourceInterface>(
      () => NewNoteDatasourceMock(),
    );
  }

  @override
  void injectRepositories() {
    getIt.registerFactory<NewNoteRepositoryInterface>(
      () => NewNoteRepositoryImpl(datasource: getIt()),
    );
  }

  @override
  void injectUsecases() {
    getIt
      ..registerFactory(() => CreateNoteUseCase(repository: getIt()))
      ..registerFactory(() => EditNoteUsecase(repository: getIt()));
  }

  @override
  void injectControllers() {
    getIt.registerFactory(
      () => NewNoteController(createNote: getIt(), editNote: getIt()),
    );
  }
}
