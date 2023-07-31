import '../../../../core/data/error/error_handler.dart';
import '../../../../core/entities/failure.dart';

class HomeErrorHandler implements ErrorHandler {
  @override
  Failure? handleError(Exception e) {
    return Failure(message: e.toString());
  }
}
