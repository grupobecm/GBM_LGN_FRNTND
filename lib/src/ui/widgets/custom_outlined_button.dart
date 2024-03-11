import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData? icon;

  const CustomOutlinedButton({
    required this.onPressed,
    required this.text,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: icon != null
          ? ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              ),
              side: MaterialStatePropertyAll(
                BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            )
          : Theme.of(context).outlinedButtonTheme.style,
      onPressed: () {
        onPressed();
      },
      child: icon == null
          ? Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.secondary),
                Text(text, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
    );
  }
}
