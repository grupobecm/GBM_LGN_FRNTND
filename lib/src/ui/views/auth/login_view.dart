import 'package:boletera/src/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();

    return ModalProgressHUD(
      inAsyncCall: authBloc.state.isLoading,
      color: Theme.of(context).colorScheme.shadow,
      progressIndicator: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondaryContainer),
      opacity: 0.15,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: const Form(
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(height: 40),
                SocialButtons(),
                SizedBox(height: 40),
                LoginForm(),
                SizedBox(height: 20),
                BottomLinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
