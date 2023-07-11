import 'app_state.dart';

class ScaffoldAppState extends AppState {
  String onSuccessMessage;
  final String? onErrorMessage;
  final String? onLoadingMessage;

  ScaffoldAppState({
    required this.onSuccessMessage,
    this.onErrorMessage,
    this.onLoadingMessage,
  });
}
