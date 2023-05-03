import 'package:flutter/material.dart';

import '../../../../core/widgets/note_app_bar.dart';
import '../../../../injectors.dart';
import '../../../new_note/presentation/pages/new_note_page.dart';
import '../../domain/entities/note.dart';
import '../controller/home_controller.dart';
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
      appBar: NoteAppBar(
        title: const Text('Flutter Notes App'),
      ),
      floatingActionButton: HomeFloatingButton(
        onClick: _onClickAddNote,
      ),
      body: HomeBody(controller: _controller),
    );
  }

  void _onClickAddNote() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return const NewNotePage();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
