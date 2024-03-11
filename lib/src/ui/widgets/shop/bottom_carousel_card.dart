import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:boletera/src/models/models.dart';

class BottomCarouselCard extends StatelessWidget {
  final List<Event> events;

  const BottomCarouselCard({
    required this.events,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      //TODO: Poner en Carrucel maximo 3 cards.
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SmallEventCard(),
        SmallEventCard(),
        SmallEventCard(),
      ],
    );
  }
}
