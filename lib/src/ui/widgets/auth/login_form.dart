import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.loginSubtitle,
          style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 40),
        TextFormField(
          decoration: customDecoration(AppLocalizations.of(context)!.loginForm1, context),
          cursorColor: Colors.black,
        ),
        const SizedBox(height: 30),
        TextFormField(
          decoration: customDecoration(AppLocalizations.of(context)!.loginForm2, context),
          cursorColor: Colors.black,
        ),
        const SizedBox(height: 30),
        Container(
          width: 400,
          height: 35,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color(0xFF4e85f4),
                Color(0xFF5529ef),
              ],
              stops: [0.2, 0.8],
            ),
          ),
          child: MaterialButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hoverColor: const Color(0xFF4a68f4).withOpacity(0.7),
            child: Text(
              AppLocalizations.of(context)!.loginButton,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pushNamed(context, Flurorouter.registerRoute),
          ),
        ),
      ],
    );
  }

  InputDecoration customDecoration(String title, BuildContext context) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: title,
        labelStyle: Theme.of(context).textTheme.labelMedium);
  }
}
