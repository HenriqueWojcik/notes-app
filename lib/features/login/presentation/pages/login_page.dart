import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: Center(
        child: ElevatedButton(
          onPressed: _onClickLogin,
          child: const Text('Login'),
        ),
      ),
    );
  }

  Future<void> _onClickLogin() async {
    await controller.login();
  }

  void _onSuccess() => context.go(Routes.home);
}
