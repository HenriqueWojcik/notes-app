import 'package:flutter/material.dart';

import '../controller/new_note_controller.dart';

class NewNoteBody extends StatelessWidget {
  final NewNoteController controller;
  final Function(String title) onChangeTitle;
  final Function(String body) onChangeBody;

  const NewNoteBody({
    Key? key,
    required this.controller,
    required this.onChangeTitle,
    required this.onChangeBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Column(
        children: [
          TextFormField(
            controller: controller.titleController,
            onChanged: onChangeTitle,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Título',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextFormField(
            controller: controller.bodyController,
            onChanged: onChangeBody,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Anotação',
            ),
          ),
        ],
      ),
    );
  }
}
