// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:boletera/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/models/models.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class CreateAreaView extends StatelessWidget {
  const CreateAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    eventsBloc.resetFormKey(loginFormKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Areas del evento', style: Theme.of(context).textTheme.titleLarge),
        Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
        _AreasListView(areasList: eventsBloc.state.event.areas!),
      ],
    );
  }
}

class _AreasListView extends StatelessWidget {
  final List<EventArea> areasList;

  const _AreasListView({
    required this.areasList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return areasList.isEmpty
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('Crea un Area', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                Icon(
                  Icons.add_circle_outline_outlined,
                  size: 50,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ))
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: areasList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(areasList[index].name.toString()),
                direction: DismissDirection.endToStart,
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Eliminar', style: Theme.of(context).textTheme.headlineMedium),
                      ),
                    ),
                  ),
                ),
                child: CustomHorizontalCard(area: areasList[index]),
                onDismissed: (direction) {
                  print('Dissmised'); // TODO: Eliminar de la lista
                },
              );
            },
          );
  }
}

class CreateAreaForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CreateAreaForm({
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 400),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Crear Area', style: Theme.of(context).textTheme.titleLarge),
              Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
              CustomFormField(text: 'Nombre del Area *', onChanged: (value) => eventsBloc.setArea(name: value)),
              SizedBox(
                width: 250,
                child: CustomDropdownButton(
                  items: const ['Abierto', 'Cerrado'],
                  typeButton: 2,
                  text: 'Status del Area *',
                  onChanged: (value) {
                    if (value == 'Abierto') {
                      eventsBloc.setArea(status: 'Open');
                    } else {
                      eventsBloc.setArea(status: 'Close');
                    }
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomGradientButton(
                      text: 'Crear',
                      onPressed: () async {
                        final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
                        final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar();

                        eventsBloc.saveArea();
                        await Future.delayed(const Duration(milliseconds: 100));
                        await eventsBloc.createArea(context);
                        if (auxiliaryCubit.state.code.isNotEmpty) {
                          auxiliaryCubit.getMessageString(appLocalizations);
                          scaffoldMessenger.showSnackBar(
                            auxiliaryCubit.generateMessage(
                              auxiliaryCubit.state.code == '200' ? ContentType.success : ContentType.failure,
                            ),
                          );
                        }

                        // if (auxiliaryCubit.state.code == '200' || auxiliaryCubit.state.code == '201') eventsBloc.passStep();
                        auxiliaryCubit.resetMessage();
                        NavigationService.goBack();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
