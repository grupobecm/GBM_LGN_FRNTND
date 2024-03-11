import 'package:flutter/material.dart';

class SubtitleDivider extends StatelessWidget {
  final String text;

  const SubtitleDivider({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
