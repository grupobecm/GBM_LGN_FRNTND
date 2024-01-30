// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();
    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

    authBloc.resetFormKey(registerFormKey);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370, maxHeight: 1150, minHeight: 1150),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: authBloc.formKey,
            child: const Column(
              children: [
                CustomTitle(),
                SizedBox(height: 40),
                SocialButtons(),
                SizedBox(height: 40),
                _NewAcountForm(),
                SizedBox(height: 40),
                // ResgisterLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _NewAcountForm extends StatelessWidget {
  const _NewAcountForm();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.authSubtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 40),
        CustomFormField(text: AppLocalizations.of(context)!.formName, onChanged: () {}),
        CustomFormField(text: AppLocalizations.of(context)!.formLastName, onChanged: () {}),
        CustomFormField(text: AppLocalizations.of(context)!.formEmail, validationTipe: 1, onChanged: () {}),
        CustomFormField(
            text: AppLocalizations.of(context)!.formPass, visibilityIcon: true, validationTipe: 2, onChanged: () {}),
        CustomFormField(
            text: AppLocalizations.of(context)!.formPassConfirm,
            visibilityIcon: true,
            validationTipe: 2,
            onChanged: () {}),
        Row(
          // TODO: Optimizar
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              AppLocalizations.of(context)!.newAcountCheckBox1,
              style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              AppLocalizations.of(context)!.newAcountCheckBox2,
              style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            SizedBox(
              width: 330,
              child: Text(
                AppLocalizations.of(context)!.newAcountCheckBox3,
                style: GoogleFonts.montserratAlternates(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ),
          ],
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
              AppLocalizations.of(context)!.newAccountButton,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pushNamed(context, Flurorouter.registerRoute),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.haveAcount,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            TextButton(
              style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              child: Text(
                AppLocalizations.of(context)!.loginButton,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, Flurorouter.loginRoute),
            ),
          ],
        ),
      ],
    );
  }
}

