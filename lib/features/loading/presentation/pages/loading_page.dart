import 'package:flutter/material.dart';
import 'package:my_foundation/main.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AppProgressIndicator(),
        ),
      ),
    );
  }
}
