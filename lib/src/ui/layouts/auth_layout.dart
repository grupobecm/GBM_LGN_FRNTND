import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Theme.of(context).colorScheme.shadow,
          title: Image.asset(
            'assets/images/logo_black.png',
            scale: 13,
          ),
          elevation: 5,
        ),
        body: GraphQLProvider(
          client: GraphQLClients.authClient,
          child: (size.width > 1000) ? _DesktopBody(child: child) : _MobileBody(child: child),
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          const Expanded(child: BackgroundAuth()),
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
                    SizedBox(
                      height: 1000, //TODO: Cambiar el largo dependiendo de la vista
                      child: Column(
                        children: [
                          const CustomTitle(),
                          const SizedBox(height: 40),
                          Expanded(child: child),
                        ],
                      ),
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
  final Widget child;

  const _MobileBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView(
          controller: scrollController,
          children: [
            Container(
              width: size.width,
              height: 1000, // TODO: Modificar de acuerdo a la vista
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const CustomTitle(),
                  const SizedBox(height: 40),
                  Expanded(child: child),
                ],
              ),
            ),
            const Expanded(child: BackgroundAuth())
          ],
        ),
      ),
    );
  }
}
