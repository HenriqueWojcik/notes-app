import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/enums/env.dart';
import 'core/i18n/i18n.dart';
import 'core/routes/navigator.dart';
import 'firebase_helper.dart';
import 'injectors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseHelper.init();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> _init() async {
    Injectors.inject(Env.prod);
    I18n.load(
      Intl.getCurrentLocale(),
    );
    await FirebaseHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          routerConfig: AppNavigator.router,
        );
      },
    );
  }
}
