import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/routes/router.dart';

class BottomLinks extends StatelessWidget {
  const BottomLinks({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextButton(
          style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          child: Text(
            AppLocalizations.of(context)!.loginForgotPass,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          onPressed: () => Navigator.pushReplacementNamed(context, Flurorouter.recoveryPassRoute),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.loginAreYouNew,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            TextButton(
              style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              child: Text(
                AppLocalizations.of(context)!.loginNewAcount,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, Flurorouter.registerRoute),
            ),
          ],
        ),
      ],
    );
  }
}
