import 'package:flutter/material.dart';

class ChangePassTest extends StatelessWidget {
  const ChangePassTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Password Cambiado Correctamente',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}