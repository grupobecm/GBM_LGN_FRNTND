import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/views.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.watch<AuthBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GraphQLProvider(
        client: GraphQLClients.authClient,
        child: ModalProgressHUD(
          inAsyncCall: auxiliaryCubit.state.isLoading,
          progressIndicator: const LoaderView(),
          opacity: 0.15,
          child: (size.width > 1000)
              ? _DesktopBody(
                  mode: authBloc.state.viewMode,
                  scrollController: authBloc.scrollController,
                  child: child,
                )
              : _MobileBody(
                  mode: authBloc.state.viewMode,
                  scrollController: authBloc.scrollController,
                  child: child,
                ),
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final int mode;
  final Widget child;
  final ScrollController scrollController;

  const _DesktopBody({
    required this.mode,
    required this.child,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          Expanded(child: BackgroundAuth(mode: mode)),
          Container(
            color: Theme.of(context).colorScheme.primary,
            width: 600,
            height: double.infinity,
            child: Center(
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: ListView(
                  controller: scrollController,
                  children: [
                    const LogoImage(topPadding: 80),
                    SizedBox(
                      height: mode == 1
                          ? 700
                          : mode == 2
                              ? 1150
                              : 600,
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final int mode;
  final Widget child;
  final ScrollController scrollController;

  const _MobileBody({
    required this.mode,
    required this.child,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: IntrinsicHeight(
          child: ListView(
            controller: scrollController,
            children: [
              Container(
                width: size.width,
                color: Theme.of(context).colorScheme.primary,
                child: const LogoImage(topPadding: 80),
              ),
              Container(
                width: size.width,
                height: mode == 1
                    ? 700
                    : mode == 2
                        ? 1150
                        : 600,
                color: Theme.of(context).colorScheme.primary,
                child: child,
              ),
              BackgroundAuth(mode: mode)
            ],
          ),
        ),
      ),
    );
  }
}
