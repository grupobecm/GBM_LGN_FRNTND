import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final List<String> list = ['F1 Fanzone Jalisco Patrocinadores', 'Evento 2', 'Evento 3', 'Evento 4', 'Evento 5', 'Evento 6', 'Evento 7'];

    return Column(
      children: [
        _HomeHeader(),
        Expanded(
          child: GridView.extent(
            controller: scrollController,
            childAspectRatio: 370 / 300,
            maxCrossAxisExtent: 370,
            crossAxisSpacing: 30,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(20),
            children: List.generate(list.length, (index) => EventCard(title: list[index])),
          ),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  // const _HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text('Mis eventos', style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('En venta(0)'),
                  Text('En revisión(0)'),
                  Text('Pasados(0)'),
                  Text('Todos(1)'),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 50,)
      ],
    );
  }
}
