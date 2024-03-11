import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 120,
          height: 40,
          child: SignInButton(
            Buttons.Apple,
            text: 'iCloud',
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 120,
          height: 40,
          child: SignInButton(
            Buttons.Google,
            text: 'Google',
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
