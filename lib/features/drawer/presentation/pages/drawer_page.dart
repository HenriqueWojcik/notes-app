import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigator/app_navigator_interface.dart';
import '../../../../core/navigator/routes.dart';
import '../../../../injectors.dart';
import '../../../../core/helpers/string_extension.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final User user = getIt();
  final AppNavigatorInterface navigator = getIt();

  String? get photoUrl => user.photoURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (photoUrl != null) ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(photoUrl!),
                        maxRadius: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                    IconButton(
                      onPressed: _onClickLogout,
                      icon: const Icon(Icons.logout_outlined),
                    ),
                  ],
                ),
                Text(user.displayName?.toTitleCase() ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onClickLogout() {
    Injectors.unregisterUser();
    navigator.popAll(Routes.login);
  }
}
