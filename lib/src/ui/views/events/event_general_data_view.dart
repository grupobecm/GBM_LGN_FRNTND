import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class EventGeneralDataView extends StatefulWidget {
  const EventGeneralDataView({super.key});

  @override
  State<EventGeneralDataView> createState() => _EventGeneralDataViewState();
}

class _EventGeneralDataViewState extends State<EventGeneralDataView> {
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late int _selectedValue;

  @override
  void initState() {
    _selectedValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();

    eventsBloc.resetFormKey(_loginFormKey);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Datos del evento', style: Theme.of(context).textTheme.bodyMedium),
          Divider(color: Theme.of(context).colorScheme.secondary),
          Text('Tipo de evento', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.start),
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: 1,
                onChanged: (value) => setState(() => _selectedValue = value as int),
              ),
              const Text('Opción 1'),
              Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) => setState(() => _selectedValue = value as int),
              ),
              const Text('Opción 1'),
            ],
          ),
          CustomFormField(
            text: 'Nombre del Evento *',
            // validationTipe: 2,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
