import 'package:flutter/material.dart';

import '../../../../injectors.dart';
import '../../../home_page/domain/entities/note.dart';
import '../controller/new_note_controller.dart';
import '../widgets/new_note_app_bar.dart';
import '../widgets/new_note_body.dart';

class NewNotePage extends StatefulWidget {
  final Note? note;

  const NewNotePage({
    super.key,
    this.note,
  });

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final NewNoteController _controller = getIt<NewNoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewNoteAppBar(
        controller: _controller,
        onClickPinned: _onClickPinned,
        onClickDelete: _onClickDelete,
        onClickDone: _onClickDone,
      ),
      body: NewNoteBody(
        onChangeTitle: _onChangedTitle,
        onChangeBody: _onChangeBody,
      ),
    );
  }

  void _onChangedTitle(String title) => _controller.setTitle(title);

  void _onChangeBody(String body) => _controller.setBody(body);

  void _onClickPinned() => _controller.setPinned();

  void _onClickDelete() {}

  void _onClickDone() => _controller.createNewNote();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
