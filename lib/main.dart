import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'core/enums/env.dart';
import 'core/i18n/i18n.dart';
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
  }

  Future<void> _init() async {
    Injectors.inject(Env.prod);
    I18n.load(
      Intl.getCurrentLocale(),
    );
    await FirebaseHelper.init();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      builder: (_, __) {
        return FutureBuilder(
          future: _init(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (getIt<FirebaseHelper>().isAuthenticate()) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        );
      },
      routerConfig: GoRouter(
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
