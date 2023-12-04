import 'package:my_foundation/main.dart';

class HomeErrorHandler implements ErrorHandler {
  @override
  Failure? handleError(Exception e) {
    return Failure(message: e.toString(), title: 'Error');
  }
}
