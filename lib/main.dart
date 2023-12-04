import 'package:flutter/material.dart';

import 'config_app.dart';
import 'core/enums/env.dart';
import 'core/navigator/app_navigator_impl.dart';
import 'features/loading/presentation/pages/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ConfigApp.onInit(Env.prod),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
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
