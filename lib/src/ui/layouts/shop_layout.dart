import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/views/views.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class ShopLayout extends StatelessWidget {
  final Widget child;

  const ShopLayout({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final AuthBloc authBloc = context.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: FilledButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
              child: Row(
                children: [
                  const Icon(Icons.account_circle, size: 30),
                  const SizedBox(width: 5),
                  Text(AppLocalizations.of(context)!.loginButton),
                ],
              ),
              onPressed: () => NavigationService.replaceTo(Flurorouter.loginRoute, auxiliaryCubit),
            ),
          )
        ],
        title: Row(
          children: [
            const LogoImage(scale: 17.5, horizontalPadding: false),
            const SizedBox(width: 10),
            Container(
              height: 55,
              width: 1,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(width: 10),
          ],
        ),
        elevation: 5,
      ),
      body: Column(
        children: [
          const _MultiColorBar(),
          Expanded(
            child: Row(
              children: [
                GraphQLProvider(
                  client: GraphQLClients.novekClient,
                  child: Expanded(
                    child: ModalProgressHUD(
                      inAsyncCall: auxiliaryCubit.state.isLoading,
                      progressIndicator: const LoaderView(),
                      opacity: 0.15,
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MultiColorBar extends StatelessWidget {
  const _MultiColorBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF4e85f4))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF5529ef))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF2f2778))),
      ],
    );
  }
}
