import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function onPressed;

  const CustomFlatButton({
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
