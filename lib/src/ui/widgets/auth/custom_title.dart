import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          AppLocalizations.of(context)!.loginTitle, // TODO: Modify Title with respective view
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
