import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  const BackgroundAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Center(
        widthFactor: 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: buildImage(size),
        ),
      ),
    );
  }

  Image buildImage(Size size) {
    // Logica para los distintos Background images que se requieran

    return Image.asset(
      'assets/images/img-login.png',
      width: size.width * 0.4,
    );
  }
}
