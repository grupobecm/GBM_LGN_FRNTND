import 'package:flutter/material.dart';

import 'package:boletera/src/models/models.dart';

class CustomHorizontalCard extends StatelessWidget {
  final EventArea? area;
  final EventPhase? phase;
  final EventLineup? lineUp;

  const CustomHorizontalCard({
    this.area,
    this.phase,
    this.lineUp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return area != null
        ? Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
            child: ListTile(
              title: Text(
                'Nombre del area: ${area!.name}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              subtitle: Text(
                'Status: ${area!.status}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(Icons.keyboard_double_arrow_left_outlined),
            ),
          )
        : phase != null
            ? Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                child: ListTile(
                  title: Text(
                    'Nombre de la Fase: ${phase!.name}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    'Cantidad: ${phase!.quantity.toString()}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  trailing: const Icon(Icons.keyboard_double_arrow_left_outlined),
                ),
              )
            : Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                child: ListTile(
                  title: Text(
                    'Nombre del invitado: ${lineUp!.name}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    'Descripción: ${lineUp!.description}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  trailing: const Icon(Icons.keyboard_double_arrow_left_outlined),
                ),
              );
  }
}
