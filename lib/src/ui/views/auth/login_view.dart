// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';


class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTitle(),
                SizedBox(height: 60),
                SocialButtons(),
                SizedBox(height: 40),
                _LoginForm(),
                SizedBox(height: 20),
                BottomLinks(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    authBloc.resetFormKey(_loginFormKey);

    return Form(
      key: authBloc.formKey,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.authSubtitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 40),
          CustomFormField(
            text: AppLocalizations.of(context)!.loginForm1,
            fieldType: 1,
            onChanged: (value) => authBloc.changeLoginData(value, null),
          ),
          CustomFormField(
            text: AppLocalizations.of(context)!.loginForm2,
            visibilityIcon: true,
            fieldType: 2,
            onChanged: (value) => authBloc.changeLoginData(null, value),
          ),
          CustomGradientButton(
            text: AppLocalizations.of(context)!.loginButton,
            isLong: true,
            onPressed: () async {
              final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
              final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();

              await authBloc.startSession(context);

              final bool isAuthenticated = await authBloc.isAuthenticated();

              if (auxiliaryCubit.state.code.isNotEmpty) {
                auxiliaryCubit.getMessageString(appLocalizations);
                scaffoldMessenger.showSnackBar(
                  auxiliaryCubit.generateMessage(
                    isAuthenticated ? ContentType.success : ContentType.failure,
                  ),
                );
              }

              auxiliaryCubit.resetMessage();
              if (isAuthenticated) NavigationService.replaceTo(Flurorouter.eventsRoute, auxiliaryCubit);
            },
          ),
        ],
      ),
    );
  }
}
