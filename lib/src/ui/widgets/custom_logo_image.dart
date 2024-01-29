import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double? topPadding;
  final double? scale;
  final bool? horizontalPadding;

  const LogoImage({
    this.topPadding,
    this.scale,
    this.horizontalPadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 0,
        left: horizontalPadding == true ? 100 : 0,
        right: horizontalPadding == true ? 100 : 0,
      ),
      child: Hero(
        tag: 1,
        child: Image.asset(
          'assets/images/logo_black.png',
          scale: scale,
        ),
      ),
    );
  }
}
