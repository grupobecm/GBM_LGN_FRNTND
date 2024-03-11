import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/ui/views/views.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TabBar(
              // dividerColor: Theme.of(context).colorScheme.secondary,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelColor: Theme.of(context).colorScheme.secondary,
              tabs: const [
                Tab(text: 'Evento'),
                Tab(text: 'Ticket'),
                Tab(text: 'Fases de Venta'),
                Tab(text: 'Códigos'),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                EditGeneralData(),
                EditTicketView(),
                EditPhaseView(),
                EditCodeView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
