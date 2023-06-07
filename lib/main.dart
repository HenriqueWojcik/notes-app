import 'package:flutter/material.dart';

import 'core/enums/env.dart';
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
    // return MaterialApp.router(
    //   routerConfig: GoRouter(
    //     routes: [
    //       GoRoute(
    //         path: '/',
    //         builder: (_, __) => const HomePage(),
    //       ),
    //       GoRoute(
    //         path: 'notes',
    //         builder: (context, state) => const NewNotePage(),
    //       )
    //     ],
    //   ),
    // );

    return MaterialApp(
      theme: ThemeData(
          // fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      home: const LoginPage(),
    );
  }
}
