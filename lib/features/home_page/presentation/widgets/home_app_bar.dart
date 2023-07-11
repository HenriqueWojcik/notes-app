import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/home_view.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/state/app_state_builder.dart';
import '../../../../injectors.dart';
import '../controller/home_controller.dart';

class HomeAppBar extends StatelessWidget {
  final HomeController controller;
  final Function(String value) onSearchNotes;
  final Function() onClickDrawerIcon;
  final Function() onClickHomeViewIcon;

  HomeAppBar({
    Key? key,
    required this.controller,
    required this.onSearchNotes,
    required this.onClickDrawerIcon,
    required this.onClickHomeViewIcon,
  }) : super(key: key);

  final User user = getIt();

  String? get photoUrl => user.photoURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 5),
      child: Row(
        children: [
          IconButton(
            onPressed: onClickDrawerIcon,
            icon: const Icon(Icons.menu),
          ),
          Expanded(
            child: TextFormField(
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
                onPressed: onClickHomeViewIcon,
                icon: Icon(
                  homeView == HomeView.list ? Icons.grid_view : Icons.list,
                ),
              );
            },
          ),
          if (photoUrl != null) ...[
            CircleAvatar(
              backgroundImage: NetworkImage(photoUrl!),
              maxRadius: 15,
            ),
            const SizedBox(
              width: 10,
            )
          ]
        ],
      ),
    );
  }
}
