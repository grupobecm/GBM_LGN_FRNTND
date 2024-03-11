import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isLong;
  final bool isRectangular;
  final IconData? icon;

  const CustomGradientButton({
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLong = false,
    this.isRectangular = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isRectangular
          ? null
          : isLong
              ? 400
              : 120,
      height: isRectangular ? null : 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(isRectangular ? 6 : 20)),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.shadow,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
          stops: const [0.2, 0.8],
        ),
      ),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hoverColor: const Color(0xFF4a68f4).withOpacity(0.7),
        onPressed: () async => await onPressed(),
        child: Padding(
          padding: isRectangular ? const EdgeInsets.symmetric(horizontal: 23.0, vertical: 12) : const EdgeInsets.all(0),
          child: icon == null
              ? Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(icon, color: Colors.white),
                    Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
