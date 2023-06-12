import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/enums/env.dart';
import 'core/routes/routes.dart';
import 'features/home_page/presentation/pages/home_page.dart';
import 'features/login/presentation/pages/login_page.dart';
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
  @override
  void initState() {
    super.initState();

    Injectors.inject(Env.prod);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routerConfig: GoRouter(
        initialLocation: Routes.login,
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (_, __) => const HomePage(),
          ),
          GoRoute(
            path: Routes.login,
            builder: (_, __) => const LoginPage(),
          ),
          // GoRoute(
          //   path: 'notes',
          //   builder: (context, state) => const NewNotePage(),
          // )
        ],
      ),
    );
  }
}
