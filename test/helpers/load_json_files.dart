import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<Map<String, dynamic>>> loadJsonFile(String file) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final result = await rootBundle.loadString('assets/mocks/$file');

  final List<Map<String, dynamic>> map = [];

  for (var element in json.decode(result)) {
    map.add(element as Map<String, dynamic>);
  }

  return map;
}
