abstract class AppNavigatorInterface {
  Future push<T>(String location, {Object? extra});
  void pushReplacement<T>(String location, {Object? extra});
}
