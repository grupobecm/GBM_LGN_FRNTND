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

  // TODO: Generate Mobile  and Desktop view
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView( // TODO: Revisar si es mejor usar una constrainde box
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(widget.title, overflow: TextOverflow.ellipsis)),
                  Switch(value: isSelected, onChanged: (value) => setState(() => isSelected = !isSelected)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Text('09/01/2024 - 10/01/2024', overflow: TextOverflow.ellipsis)),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('assets/images/no_event_image.png')),
                ],
              ),
              const SizedBox(height: 10),
              Row(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}