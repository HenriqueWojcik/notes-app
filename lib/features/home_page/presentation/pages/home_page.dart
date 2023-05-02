import 'package:flutter/material.dart';

import '../../../../injectors.dart';
import '../bloc/home_controller.dart';
import '../widgets/home_body.dart';
import '../widgets/home_floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Flutter Notes App'),
      ),
      floatingActionButton: HomeFloatingButton(
        onClick: _onClickAddNote,
      ),
      body: HomeBody(controller: _controller),
    );
  }

  void _onClickAddNote() {}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
