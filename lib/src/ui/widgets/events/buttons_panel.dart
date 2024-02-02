import 'package:boletera/src/ui/widgets/custom_gradient_button.dart';
import 'package:boletera/src/ui/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOutlinedButton(onPressed: () {}, text: 'Guardar'),
        const SizedBox(width: 10),
        CustomGradientButton(onPressed: () {}, text: 'Continuar'),
      ],
    );
  }
}
