import 'package:flutter/material.dart';

import '../../../../core/state/app_state_builder.dart';
import '../bloc/home_controller.dart';

class HomeBody extends StatefulWidget {
  final HomeController controller;

  const HomeBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppStateBuilder(
            state: controller.notes,
            builder: (_, state) {
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
