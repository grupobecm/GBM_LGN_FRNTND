import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'Continuar con',
          style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
