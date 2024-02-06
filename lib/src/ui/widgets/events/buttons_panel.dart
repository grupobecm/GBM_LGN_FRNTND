import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/widgets/custom_gradient_button.dart';
import 'package:boletera/src/ui/widgets/custom_outlined_button.dart';

class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(
          text: 'Guardar',
          onPressed: () {
            eventsBloc.createEvent(context);
          },
        ),
        const SizedBox(width: 10),
        CustomGradientButton(
          text: 'Continuar',
          onPressed: () {},
        ),
      ],
    );
  }
}
