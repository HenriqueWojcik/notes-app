import 'package:flutter/material.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../../core/navigator/app_navigator_interface.dart';
import '../../../../core/navigator/routes.dart';
import '../../../../core/state/scaffold_app_state_builder.dart';
import '../../../../injectors.dart';
import '../controller/login_controller.dart';
import 'keys/login_keys.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = getIt();
  final AppNavigatorInterface navigator = getIt();

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
            key: LoginKeys.appName,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              key: LoginKeys.loginWithGoogle,
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

  void _onSuccess() => navigator.pushReplacement(Routes.home);
}
