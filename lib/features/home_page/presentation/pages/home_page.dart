import 'package:flutter/material.dart';

import '../../../../core/navigator/app_navigator_interface.dart';
import '../../../../core/navigator/routes.dart';
import '../../../../injectors.dart';
import '../../../drawer/presentation/pages/drawer_page.dart';
import '../../domain/entities/note.dart';
import '../controller/home_controller.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_body.dart';
import '../widgets/home_floating_button.dart';
import 'keys/home_keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt();
  final AppNavigatorInterface navigator = getIt();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const DrawerPage(),
      floatingActionButton: HomeFloatingButton(
        key: HomeKeys.floatingButton,
        onClick: _onClickAddNote,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(
              controller: controller,
              onClickDrawerIcon: _onClickDrawerIcon,
              onClickHomeViewIcon: _onClickHomeViewIcon,
              onSearchNotes: _onSearchNotes,
            ),
            Expanded(
              child: HomeBody(
                controller: controller,
                onClickNoteCard: _onClickNoteCard,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchNotes(String value) => controller.onSearchNotes(value);

  void _onClickAddNote() async {
    bool? result = await _openNewNotePage();

    controller.update(refresh: result);
  }

  void _onClickNoteCard(Note note) async {
    bool? result = await _openNewNotePage(note: note);

    controller.update(refresh: result);
  }

  void _onClickDrawerIcon() =>
      controller.scaffoldKey.currentState?.openDrawer();

  void _onClickHomeViewIcon() => controller.changeHomeViewState();

  Future<bool?> _openNewNotePage({Note? note}) async {
    bool? result = await navigator.push<bool>(
      Routes.noteDetail,
      extra: note,
    );

    return result ?? false;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller.scaffoldKey.currentState?.dispose();
  }
}
