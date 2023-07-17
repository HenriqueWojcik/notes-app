import 'app_state.dart';

class ScaffoldAppState extends AppState {
  String onSuccessMessage;
  String get onErrorMessage => error?.toString() ?? '';
  final String? onLoadingMessage;

  ScaffoldAppState({
    required this.onSuccessMessage,
    this.onLoadingMessage,
  });
}
