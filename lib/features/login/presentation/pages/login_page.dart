import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/state/scaffold_app_state_builder.dart';
import '../../../../injectors.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppStateBuilder(
      onSuccess: _onSuccess,
      state: controller.scaffoldState,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            I18n.strings.appName,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: _onClickLogin,
              child: Text(I18n.strings.loginWithGoogle),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onClickLogin() async {
    await controller.login();
  }

  void _onSuccess() => context.go(Routes.home);
}
