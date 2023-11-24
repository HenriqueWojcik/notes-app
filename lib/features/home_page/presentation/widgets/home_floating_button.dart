import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  final Function() onClick;

  const HomeFloatingButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      backgroundColor: Colors.black,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
