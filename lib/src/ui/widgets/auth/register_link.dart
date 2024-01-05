import 'package:boletera/src/routes/router.dart';
import 'package:flutter/material.dart';

class ResgisterLink extends StatelessWidget {
  const ResgisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          style: Theme.of(context).textTheme.labelSmall,
          '¿Eres nuevo en Ticketin? ',
        ),
        TextButton(
          style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          child: Text(
            'Crea una cuenta',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Flurorouter.registerRoute);
          },
        ),
      ],
    );
  }
}
