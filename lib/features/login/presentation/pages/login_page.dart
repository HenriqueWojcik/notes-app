import 'package:flutter/material.dart';

import '../../../../injectors.dart';
import '../../../home_page/presentation/pages/home_page.dart';
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
    return Scaffold(
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

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }
}
