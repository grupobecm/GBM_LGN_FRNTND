import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  final int mode;
  const BackgroundAuth({required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      widthFactor: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: buildImage(size),
      ),
    );
  }

  Image buildImage(Size size) {
    // Logica para los distintos Background images que se requieran

    return Image.asset(
      mode == 1 ? 'assets/images/img-login.png' : 'assets/images/img-registro.png',
      width: size.width * 0.4,
    );
  }
}
