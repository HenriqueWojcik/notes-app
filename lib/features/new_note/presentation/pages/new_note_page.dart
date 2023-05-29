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
  void initState() {
    super.initState();
    _controller.init(widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewNoteAppBar(
        controller: _controller,
        onClickBack: _onClickBack,
        onClickPinned: _onClickPinned,
        onClickDelete: _onClickDelete,
        onClickDone: _onClickDone,
      ),
      body: NewNoteBody(
        controller: _controller,
        onChangeTitle: _onChangedTitle,
        onChangeBody: _onChangeBody,
      ),
    );
  }

  void _onChangedTitle(String title) => _controller.setTitle(title);

  void _onChangeBody(String body) => _controller.setBody(body);

  void _onClickBack() => Navigator.of(context).pop();

  void _onClickPinned() => _controller.setPinned();

  Future<void> _onClickDelete() async {
    await _controller.deleteNote();

    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _onClickDone() async {
    final result = await _controller.createNewNote();

    if (mounted) {
      Navigator.of(context).pop(result);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
