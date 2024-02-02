import 'package:flutter/material.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final List<String> list = [
      'F1 Fanzone Jalisco Patrocinadores',
      'Evento 2',
      'Evento 3',
      'Evento 4',
      'Evento 5',
      'Evento 6',
      'Evento 7'
    ];

    return Column(
      children: [
        _HomeHeader(),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.extent(
            controller: scrollController,
            childAspectRatio: 450 / 300, // Ajusta este valor según tus necesidades
            maxCrossAxisExtent: 600,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(20),
            children: List.generate(
              list.length,
              (index) => EventCard(title: list[index]),
            ),
          ),
        ),
      ],
    );
  }
} // TODO: Crear vista Mobile

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 3,),
            Center(child: Text('Mis eventos', style: Theme.of(context).textTheme.displayMedium)),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
              onPressed: () => NavigationService.replaceTo(Flurorouter.createEventRoute),
              child: const Icon(Icons.add),
            ),
            const Spacer()
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('En venta(0)'),
            Text('Pasados(0)'),
            Text('Todos(1)'),
          ],
        ),
      ],
    );
  }
}
