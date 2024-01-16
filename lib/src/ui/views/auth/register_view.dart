import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: const Form(
          child: Column(
            children: [
              CustomTitle(),
              SizedBox(height: 40),
              SocialButtons(),
              SizedBox(height: 40),
              NewAcountForm(),
              SizedBox(height: 40),
              // ResgisterLink(),
            ],
          ),
        ),
      ),
    );
  }
}