import 'package:flutter/material.dart';

import '../../../../injectors.dart';
import '../../../new_note/presentation/pages/new_note_page.dart';
import '../../domain/entities/note.dart';
import '../controller/home_controller.dart';
import '../widgets/home_app_bar.dart';
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
      floatingActionButton: HomeFloatingButton(
        onClick: _onClickAddNote,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(
              controller: _controller,
              onClickDrawerIcon: _onClickDrawerIcon,
              onClickHomeViewIcon: _onClickHomeViewIcon,
              onSearchNotes: _onSearchNotes,
            ),
            Expanded(
              child: HomeBody(
                controller: _controller,
                onClickNoteCard: _onClickNoteCard,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchNotes(String value) => _controller.onSearchNotes(value);

  void _onClickAddNote() async {
    bool? result = await _openNewNotePage();

    _controller.update(refresh: result);
  }

  void _onClickNoteCard(Note note) async {
    bool? result = await _openNewNotePage(note: note);

    _controller.update(refresh: result);
  }

  void _onClickDrawerIcon() {}

  void _onClickHomeViewIcon() => _controller.changeHomeViewState();

  Future<bool?> _openNewNotePage({Note? note}) async {
    bool? result = await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return NewNotePage(note: note);
      },
    );

    return result;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
