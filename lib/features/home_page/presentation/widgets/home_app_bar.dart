import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/state/app_state_builder.dart';
import '../controller/home_controller.dart';

class HomeAppBar extends StatelessWidget {
  final HomeController controller;
  final Function() onClickDrawerIcon;
  final Function() onClickHomeViewIcon;

  const HomeAppBar({
    Key? key,
    required this.controller,
    required this.onClickDrawerIcon,
    required this.onClickHomeViewIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: onClickDrawerIcon,
            icon: const Icon(Icons.menu),
          ),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Pesquisar suas notas',
              ),
            ),
          ),
          AppStateBuilder(
            state: controller.homeView,
            builder: (_, state) {
              final homeView = state.data;
              return IconButton(
                onPressed: onClickHomeViewIcon,
                icon: Icon(
                  homeView == HomeView.list ? Icons.grid_view : Icons.list,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
