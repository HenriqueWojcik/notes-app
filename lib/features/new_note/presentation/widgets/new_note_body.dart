import 'package:flutter/material.dart';

class NewNoteBody extends StatefulWidget {
  const NewNoteBody({super.key});

  @override
  State<NewNoteBody> createState() => _NewNoteBodyState();
}

class _NewNoteBodyState extends State<NewNoteBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        TextFormField(),
      ],
    );
  }
}
