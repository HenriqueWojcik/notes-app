abstract class FeatureInjector {
  void inject() {
    injectRepositories();
    injectUsecases();
    injectControllers();
  }

  void injectDatasourcesImpl();
  void injectDatasourcesMock();
  void injectRepositories();
  void injectUsecases();
  void injectControllers();
}
