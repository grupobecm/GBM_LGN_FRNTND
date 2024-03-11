import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Function onPressed;

  const CustomTextButton({
    required this.text,
    this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late bool _isHovered;

  @override
  void initState() {
    _isHovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: () => widget.onPressed(),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // Cambiar el color al pasar el ratón por encima
              return _isHovered
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.secondary;
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon),
            const SizedBox(width: 10),
            Text(widget.text),
          ],
        ),
      ),
    );
  }
}
