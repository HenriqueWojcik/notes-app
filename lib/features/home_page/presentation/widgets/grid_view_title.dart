import 'package:flutter/material.dart';

class GridViewTitle extends StatelessWidget {
  final String title;

  const GridViewTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.black38),
      ),
    );
  }
}
