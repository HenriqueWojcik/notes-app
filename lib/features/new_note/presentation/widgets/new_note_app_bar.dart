import 'package:flutter/material.dart';

import '../../../../core/state/app_state_builder.dart';
import '../controller/new_note_controller.dart';

class NewNoteAppBar extends AppBar {
  NewNoteAppBar({
    super.key,
    super.centerTitle = true,
    super.elevation = .5,
    super.backgroundColor = Colors.white,
    super.leading = const Icon(
      Icons.chevron_left_outlined,
      color: Colors.black87,
    ),
    required NewNoteController controller,
    required Function() onClickPinned,
    required Function() onClickDelete,
    required Function() onClickDone,
  }) : super(
          actions: [
            AppStateBuilder(
              state: controller.noteState,
              builder: (_, state) {
                bool? pinned = state.data?.pinned;
                return IconButton(
                  onPressed: onClickPinned,
                  icon: Icon(
                    pinned == null || pinned == false
                        ? Icons.push_pin_outlined
                        : Icons.push_pin_rounded,
                    color: Colors.black87,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: onClickDelete,
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.black87,
              ),
            ),
            IconButton(
              onPressed: onClickDone,
              icon: const Icon(
                Icons.done_outline_rounded,
                color: Colors.black87,
              ),
            ),
          ],
        );
}
