import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/enums/env.dart';
import 'features/home_page/presentation/pages/home_page.dart';
import 'injectors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    Injectors.inject(Env.prod);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
