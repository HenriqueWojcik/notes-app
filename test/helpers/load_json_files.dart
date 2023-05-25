import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<Map<String, dynamic>> loadJsonFile(String file) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final result = await rootBundle.loadString('assets/mocks/$file');

  return json.decode(result);
}
