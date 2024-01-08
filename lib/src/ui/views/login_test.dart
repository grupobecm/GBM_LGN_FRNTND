import 'package:flutter/material.dart';

class LoginTest extends StatelessWidget {
  const LoginTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Login Correcto',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
