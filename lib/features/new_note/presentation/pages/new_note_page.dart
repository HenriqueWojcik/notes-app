import 'package:flutter/material.dart';
import 'package:my_foundation/main.dart';

import '../../../../core/navigator/app_navigator_interface.dart';
import '../../../../injectors.dart';
import '../controller/new_note_controller.dart';
import '../widgets/new_note_app_bar.dart';
import '../widgets/new_note_body.dart';

class NewNotePage extends StatefulWidget {
  final String? noteId;

  const NewNotePage({
    super.key,
    required this.noteId,
  });

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final NewNoteController _controller = getIt<NewNoteController>();
  final AppNavigatorInterface _navigator = getIt<AppNavigatorInterface>();

  @override
  void initState() {
    super.initState();

    _controller.init(widget.noteId);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppStateBuilder(
      state: _controller.scaffoldState,
      onSuccess: _onSuccess,
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

  void _onClickBack() => _navigator.pop();

  void _onClickPinned() => _controller.setPinned();

  Future<void> _onClickDelete() async => await _controller.deleteNote();

  Future<void> _onClickDone() async => await _controller.createOrUpdateNote();

  Future<void> _onSuccess() async => _navigator.pop(true);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
