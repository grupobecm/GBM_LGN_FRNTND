import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomOutlinedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style,
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
