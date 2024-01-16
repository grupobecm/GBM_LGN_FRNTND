import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isLong;

  const CustomGradientButton({
    required this.onPressed,
    required this.text,
    this.isLong = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLong ? 400 : 120,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
