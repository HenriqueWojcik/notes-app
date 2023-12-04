import '../i18n/i18n.dart';

class Failure {
  final String title;
  final String message;

  Failure({required this.message}) : title = I18n.strings.titleError;

  @override
  String toString() {
    return '$title >> $message';
  }
}
