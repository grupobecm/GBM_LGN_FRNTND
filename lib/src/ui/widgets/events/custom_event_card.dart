import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String title;

  const EventCard({super.key, required this.title});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 400,
          minHeight: 10,
          maxHeight: 200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.title, overflow: TextOverflow.ellipsis),
                          const Text('09/01/2024 - 10/01/2024', overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                              value: isSelected,
                              inactiveThumbColor: Theme.of(context).colorScheme.inverseSurface,
                              inactiveTrackColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5),
                              activeColor: Theme.of(context).colorScheme.secondary,
                              trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                              onChanged: (value) => setState(() => isSelected = !isSelected),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/no_event_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
                        onPressed: () {},
                        child: const Text('Editar', overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)),
                        onPressed: () {},
                        child: const Text('Reportes', overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
