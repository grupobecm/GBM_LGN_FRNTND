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
  late EventsBloc _eventsBloc;

  @override
  void initState() {
    _selectedValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _eventsBloc = context.watch<EventsBloc>();

    _eventsBloc.resetFormKey(_loginFormKey);

    return Form(
      key: _eventsBloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Datos del evento', style: Theme.of(context).textTheme.titleLarge),
          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
          Text('Tipo de evento', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.start),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Radio(
                value: 1,
                groupValue: _selectedValue,
                activeColor: Theme.of(context).colorScheme.secondary,
                onChanged: (value) {
                  setState(() => _selectedValue = value as int);
                  _eventsBloc.setEventData(isForAdult: false);
                },
              ),
              const Expanded(child: Text('Público en general', overflow: TextOverflow.ellipsis)),
              Radio(
                value: 2,
                groupValue: _selectedValue,
                activeColor: Theme.of(context).colorScheme.secondary,
                onChanged: (value) {
                  setState(() => _selectedValue = value as int);
                  _eventsBloc.setEventData(isForAdult: true);
                },
              ),
              const Expanded(child: Text('Solo mayores de edad', overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: 10),
          CustomFormField(text: 'Nombre del Evento *', onChanged: (value) => _eventsBloc.setEventData(name: value)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomFormField(
                  text: 'Fecha y hora inicial *',
                  visibilityIcon: true,
                  fieldType: 3,
                  onChanged: (value) => _eventsBloc.setEventData(startDate: value),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomFormField(
                  text: 'Fecha y hora final *',
                  visibilityIcon: true,
                  fieldType: 3,
                  onChanged: (value) => _eventsBloc.setEventData(endDate: value),
                ),
              ),
            ],
          ),
          CustomFormField(
            text: 'Descripción',
            fieldType: 4,
            onChanged: (value) => _eventsBloc.setEventData(description: value),
          ),
          CustomFormField(
            text: 'Ubicación',
            onChanged: (value) => _eventsBloc.setEventData(location: value),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomDropdownButton(
                  items: const ['Privado', 'Publico'],
                  text: 'Visibilidad',
                  onChanged: (value) => _eventsBloc.setEventData(type: value),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    CustomImagePicker(
                      text: 'Imagen de Evento',
                      onChanged: (value) => _eventsBloc.setEventData(image: value),
                    ),
                    const SizedBox(height: 5),
                    CustomImagePicker(
                      text: 'Banner de Evento',
                      onChanged: (value) => _eventsBloc.setEventData(banner: value),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Column(
              //     children: [
              //       CustomCheckbox(text: 'Boletera'),
              //       CustomCheckbox(text: 'Cashless'),
              //       CustomCheckbox(text: 'Ticketin'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
