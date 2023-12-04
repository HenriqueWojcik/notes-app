import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/state/app_state_builder.dart';
import '../controller/home_controller.dart';
import '../pages/keys/home_keys.dart';

class HomeAppBar extends StatelessWidget {
  final HomeController controller;
  final Function(String value) onSearchNotes;
  final Function() onClickDrawerIcon;
  final Function() onClickHomeViewIcon;

  const HomeAppBar({
    Key? key,
    required this.controller,
    required this.onSearchNotes,
    required this.onClickDrawerIcon,
    required this.onClickHomeViewIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 5),
      child: Row(
        children: [
          IconButton(
            key: HomeKeys.drawerIcon,
            onPressed: onClickDrawerIcon,
            icon: const Icon(Icons.menu),
          ),
          Expanded(
            child: TextFormField(
              key: HomeKeys.textFieldSearch,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: I18n.strings.searchNotes,
              ),
              onChanged: onSearchNotes,
            ),
          ),
          AppStateBuilder(
            state: controller.homeView,
            builder: (_, state) {
              final homeView = state.data;
              return IconButton(
                key: HomeKeys.homeViewTypeIcon,
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
