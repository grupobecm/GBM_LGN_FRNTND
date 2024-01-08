import 'package:boletera/src/ui/widgets/auth/new_pass_form.dart';
import 'package:flutter/material.dart';

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
              NewPassForm(),
              // SocialButtons(),
              // SizedBox(height: 40),
              // LoginForm(),
              // SizedBox(height: 20),
              // BottomLinks(),
            ],
          ),
        ),
      ),
    );
  }
}