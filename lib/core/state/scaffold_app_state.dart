import 'app_state.dart';

class ScaffoldAppState extends AppState {
  final String onSuccessMessage;
  final String? onErrorMessage;
  final String? onLoadingMessage;

  ScaffoldAppState({
    required this.onSuccessMessage,
    this.onErrorMessage,
    this.onLoadingMessage,
  });
}
