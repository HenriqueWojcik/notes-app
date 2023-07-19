import 'package:flutter/material.dart';

class HomeKeys {
  static const String prefix = 'home_';
  static const Key floatingButton = Key('${prefix}floatingButton');
  static const Key homeViewTypeIcon = Key('${prefix}homeViewTypeIcon');
  static const Key drawerIcon = Key('${prefix}drawer');
  static const Key textFieldSearch = Key('${prefix}textFieldSearch');
  static const Key notesList = Key('${prefix}notesList');
  static Key noteCard({String? id}) => Key('${prefix}noteCard_$id');
}
