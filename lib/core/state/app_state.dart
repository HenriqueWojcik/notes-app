import 'package:flutter/foundation.dart';

class AppState<T> extends ChangeNotifier {
  T? _data;
  Exception? _error;
  bool loading = false;

  T? get data => _data;
  Exception? get error => _error;

  set value(T value) {
    _error = null;
    loading = false;
    _data = value;
    notifyListeners();
  }

  set fail(Exception e) {
    loading = false;
    _data = null;
    _error = e;
    notifyListeners();
  }

  void onLoad() {
    _error = null;
    _data = null;
    loading = true;
    notifyListeners();
  }
}
