import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/providers/login_form_provider.dart';
import 'package:boletera/src/ui/widgets/custom_form_field.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

          return Form(
            key: loginFormProvider.formKey,
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.authSubtitle,
                  style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 40),
                CustomFormField(
                    text: AppLocalizations.of(context)!.loginForm1, validationTipe: 1, provider: loginFormProvider),
                CustomFormField(
                  text: AppLocalizations.of(context)!.loginForm2,
                  visibilityIcon: true,
                  validationTipe: 2,
                  provider: loginFormProvider,
                ),
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
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (await loginFormProvider.validateForm()) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, Flurorouter.testLogedIn);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
