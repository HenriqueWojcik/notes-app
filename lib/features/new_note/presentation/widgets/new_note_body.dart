import 'package:flutter/material.dart';

class NewNoteBody extends StatelessWidget {
  final Function(String title) onChangeTitle;
  final Function(String body) onChangeBody;

  const NewNoteBody({
    super.key,
    required this.onChangeTitle,
    required this.onChangeBody,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Column(
        children: [
          TextFormField(
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
