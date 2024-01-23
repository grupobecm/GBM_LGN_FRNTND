import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_black.png',
              scale: 13,
            ),
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
                GraphQLProvider(
                  client: GraphQLClients.novekClient,
                  child: Expanded(child: child),
                ),
              ],
            ),
          ),
        ],
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
