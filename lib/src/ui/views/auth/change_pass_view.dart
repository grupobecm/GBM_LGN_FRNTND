// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boletera/src/blocs/blocs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: const Form(
          child: Column(
            children: [
              SizedBox(height: 40),
              _NewPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewPassForm extends StatelessWidget {
  const _NewPassForm();

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();
    final GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();

    authBloc.resetFormKey(changePassFormKey, 4);

    return Form(
      key: authBloc.formKey,
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
                  Navigator.pop(context);
                },
              ),
              CustomGradientButton(
                text: AppLocalizations.of(context)!.aceptButton,
                onPressed: () async {
                  if (await authBloc.setNewPass(context)) {
                    Navigator.pushReplacementNamed(context, Flurorouter.changePassRoute);
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
