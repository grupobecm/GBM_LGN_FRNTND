import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      color: Theme.of(context).colorScheme.onSurface,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20),
            MenuButton(text: 'Events', icon: Icons.event),
            MenuButton(text: 'Calendar', icon: Icons.calendar_month),
            // MenuButton(text: 'Create Event', icon: Icons.event_note_outlined),
            // MenuButton(text: 'Update Event', icon: Icons.event_note_outlined),
            // MenuButton(text: 'Event      ', icon: Icons.event_note_outlined),
          ],
        ),
      ),
    );
  }
}
