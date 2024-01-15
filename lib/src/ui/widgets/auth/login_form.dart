// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();

    return Form(
      key: authBloc.loginFormKey,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.authSubtitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 40),
          CustomFormField(
              text: AppLocalizations.of(context)!.loginForm1,
              validationTipe: 1,
              onChanged: (value) => authBloc.changeLoginData(value, null)),
          CustomFormField(
            text: AppLocalizations.of(context)!.loginForm2,
            visibilityIcon: true,
            validationTipe: 2,
            onChanged: (value) => authBloc.changeLoginData(null, value),
          ),
          CustomGradientButton(
              text: AppLocalizations.of(context)!.loginButton,
              isLong: true,
              onPressed: () async {
                if (await authBloc.startSession(context) == true) {
                  print('Holis');
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(CustomScanckBar.buildSnackBar('Success', authBloc.state.message, ContentType.success));

                  Navigator.pushNamed(context, Flurorouter.testLogedIn);
                } else {
                  print('${authBloc.state.message}');
                }
                // ScaffoldMessenger.of(context)
                //   ..hideCurrentSnackBar()
                //   ..showSnackBar(CustomScanckBar.buildSnackBar('Error', 'algo malo paso', ContentType.failure));
                // await authBloc.startSession(context) ? Navigator.pushNamed(context, Flurorouter.testLogedIn) : null;
              }),
        ],
      ),
    );
  }
}
