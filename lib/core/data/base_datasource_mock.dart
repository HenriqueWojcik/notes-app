import 'dart:convert';

import 'package:flutter/services.dart';

abstract class BaseDatasourceMock {
  Future doAsyncMock(String file) async {
    try {
      final fileLocation = 'assets/mock/$file';

      var json = await rootBundle.loadString(fileLocation);

      return jsonDecode(json);
    } catch (e) {
      throw Exception(e);
    }
  }
}
