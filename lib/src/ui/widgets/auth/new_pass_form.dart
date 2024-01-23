// ignore_for_file: use_build_context_synchronously

import 'package:boletera/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class NewPassForm extends StatelessWidget {
  const NewPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();

    return Form(
      key: authBloc.changePassFormKey,
      child: Column(
        children: [
          CustomFormField(
            text: AppLocalizations.of(context)!.loginForm2,
            visibilityIcon: true,
            validationTipe: 2,
            // provider: loginFormProvider,
            onChanged: () {},
          ),
          CustomFormField(
            text: AppLocalizations.of(context)!.confirmPass,
            visibilityIcon: true,
            validationTipe: 2,
            isConfirmPass: true,
            // provider: loginFormProvider,
            onChanged: () {},
          ),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.resetPassCodeSubtitle,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const ResetCodeField(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOutlinedButton(
                text: AppLocalizations.of(context)!.cancelButton,
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              ),
              CustomGradientButton(
                text: AppLocalizations.of(context)!.aceptButton,
                onPressed: () async {
                  if (await authBloc.setNewPass(context)) {
                    // Navigator.pushNamed(context, Flurorouter.testChangePass);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  customDecoration(String text, BuildContext context) {
    return InputDecoration(
      counterText: '',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      // labelText: text,
      labelStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}
