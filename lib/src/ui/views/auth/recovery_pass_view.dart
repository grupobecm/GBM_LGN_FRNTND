// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:boletera/src/blocs/auth/auth_bloc.dart';

class RecoveryPassView extends StatelessWidget {
  static final GlobalKey<FormState> _recoveryCodeFormKey = GlobalKey<FormState>();
  const RecoveryPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();

    authBloc.resetFormKey(_recoveryCodeFormKey);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
          key: authBloc.formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                AppLocalizations.of(context)!.resetPassSubtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 40),
              CustomFormField(
                text: AppLocalizations.of(context)!.loginForm1,
                validationTipe: 1,
                onChanged: (value) => authBloc.changeLoginData(value, null),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomOutlinedButton(
                    text: AppLocalizations.of(context)!.cancelButton,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                    },
                  ),
                  CustomGradientButton(
                    text: AppLocalizations.of(context)!.aceptButton,
                    onPressed: () async {
                      if (await authBloc.sendResetCodeEmail(context) == true) {
                        Navigator.pushReplacementNamed(context, Flurorouter.changePassRoute);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
