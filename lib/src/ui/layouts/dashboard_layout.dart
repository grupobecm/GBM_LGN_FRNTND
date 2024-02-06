import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/views/loader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const LogoImage(scale: 17.5, horizontalPadding: false),
              const SizedBox(width: 10),
              Container(
                height: 55,
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
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
                  const LateralMenu(),
                  FutureBuilder(
                    future: GraphQLClients().getNovekClient(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GraphQLProvider(
                          client: snapshot.data,
                          child: Expanded(child: child),
                        );
                      }
                      return const LoaderView();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Crear vista desctop y mobile

class _MultiColorBar extends StatelessWidget {
  const _MultiColorBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFcf3d17))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFeb6f30))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFc63282))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFbbad40))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFFe29c3a))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF50a986))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF454389))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF643369))),
        Expanded(flex: 1, child: Container(height: 4, color: const Color(0xFF6f3881))),
      ],
    );
  }
}
