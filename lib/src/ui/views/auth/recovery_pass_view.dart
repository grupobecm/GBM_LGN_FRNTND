// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:boletera/src/providers/login_form_provider.dart';

class RecoveryPassView extends StatelessWidget {
  const RecoveryPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.resetPassSubtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 40),
                  CustomFormField(
                    text: AppLocalizations.of(context)!.loginForm1,
                    validationTipe: 1,
                    // provider: loginFormProvider,
                    onChanged: () {},
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          if (await loginFormProvider.getResetCode()) {
                            Navigator.pushNamed(context, Flurorouter.changePassRoute);
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
      }),
    );
  }
}
