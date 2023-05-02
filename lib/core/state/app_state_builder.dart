import 'package:flutter/material.dart';

import 'app_state.dart';

class AppStateBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, AppState<T> state) builder;
  final AppState<T> state;

  const AppStateBuilder({
    super.key,
    required this.builder,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: state,
      builder: (context, __) {
        return builder(context, state);
      },
    );
  }
}
