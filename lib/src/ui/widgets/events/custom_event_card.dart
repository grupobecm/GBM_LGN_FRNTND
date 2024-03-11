import 'package:boletera/src/blocs/blocs.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  final dynamic event;

  const EventCard({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late EventsBloc _eventsBloc;
  late AuxiliaryCubit _auxiliaryCubit;
  late bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.event['status'] == 'Enable' ? true : false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _eventsBloc = context.watch<EventsBloc>();
    _auxiliaryCubit = context.watch<AuxiliaryCubit>();

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
                          Text(widget.event['event_name'], overflow: TextOverflow.ellipsis),
                          Text(
                            '${getDate(widget.event['start_date'])} - ${getDate(widget.event['end_date'])}',
                            overflow: TextOverflow.ellipsis,
                          ),
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
                              value: _isSelected,
                              inactiveThumbColor: Theme.of(context).colorScheme.inverseSurface,
                              inactiveTrackColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5),
                              activeColor: Theme.of(context).colorScheme.secondary,
                              trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
                              onChanged: (value) => setState(() => _isSelected = !_isSelected),
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
                  child: _eventsBloc.getImage(url: widget.event['image_banner']),
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
                        onPressed: () {
                          _eventsBloc.setSelectedEvent(widget.event);
                          NavigationService.replaceTo(Flurorouter.eventDetailsRoute, _auxiliaryCubit);
                        },
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

  String getDate(String date) {
    String dateTimeString = date;

    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDate;
  }
}
