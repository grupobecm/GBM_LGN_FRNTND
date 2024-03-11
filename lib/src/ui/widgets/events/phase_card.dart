import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhaseCard extends StatelessWidget {
  final dynamic phase;

  const PhaseCard({
    required this.phase,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Cantidad: ', style: Theme.of(context).textTheme.titleLarge),
                  Text(phase['quantity'].toString(), style: Theme.of(context).textTheme.labelMedium),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Nombre de fase: ', style: Theme.of(context).textTheme.titleLarge),
                  Expanded(child: Text(phase['phase_name'], style: Theme.of(context).textTheme.labelMedium)),
                ],
              ),
              Row(
                children: [
                  Text('Descripsión: ', style: Theme.of(context).textTheme.titleLarge),
                  Expanded(child: Text(phase['description'], style: Theme.of(context).textTheme.labelMedium)),
                ],
              ),
              Row(
                children: [
                  Text('Precio: \$', style: Theme.of(context).textTheme.titleLarge),
                  Text(phase['price'].toString(), style: Theme.of(context).textTheme.labelMedium),
                  const Spacer(),
                  Text('Inicio: ', style: Theme.of(context).textTheme.titleLarge),
                  Expanded(
                    child: Text(
                      DateFormat('dd-MM-yyyy').format(DateTime.parse(phase['start_date'])),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text('Fin: ', style: Theme.of(context).textTheme.titleLarge),
                  Expanded(
                    child: Text(
                      DateFormat('dd-MM-yyyy').format(DateTime.parse(phase['end_date'])),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
