import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: const Form(
          child: Column(
            children: [
              SocialButtons(),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 20),
              BottomLinks(),
            ],
          ),
        ),
      ),
    );
  }
}