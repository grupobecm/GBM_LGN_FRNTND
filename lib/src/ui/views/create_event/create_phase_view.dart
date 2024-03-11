// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/models/models.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class CreatePhaseView extends StatelessWidget {
  const CreatePhaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    eventsBloc.resetFormKey(loginFormKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Fases del evento', style: Theme.of(context).textTheme.titleLarge),
        Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
        _PhasesListView(phasesList: eventsBloc.state.event.phases!),
      ],
    );
  }
}

class _PhasesListView extends StatelessWidget {
  final List<EventPhase> phasesList;

  const _PhasesListView({
    required this.phasesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return phasesList.isEmpty
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('Crea una fase', style: Theme.of(context).textTheme.titleLarge),
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
            itemCount: phasesList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(phasesList[index].name.toString()),
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
                child: CustomHorizontalCard(phase: phasesList[index]),
                onDismissed: (direction) {
                  print('Dissmised'); // TODO: Eliminar de la lista
                },
              );
            },
          );
  }
}

class CreatePhaseForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CreatePhaseForm({
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Crear fase', style: Theme.of(context).textTheme.titleLarge),
                Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
                CustomFormField(text: 'Nombre de la fase *', onChanged: (value) => eventsBloc.setPhase(name: value)),
                CustomFormField(text: 'Descripción', onChanged: (value) => eventsBloc.setPhase(description: value)),
                CustomFormField(
                  text: 'Fecha y hora inicial *',
                  visibilityIcon: true,
                  fieldType: 3,
                  onChanged: (value) => eventsBloc.setPhase(startDate: value),
                ),
                CustomFormField(
                  text: 'Fecha y hora final *',
                  visibilityIcon: true,
                  fieldType: 3,
                  onChanged: (value) => eventsBloc.setPhase(endDate: value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomFormField(
                        text: 'Cantidad *',
                        fieldType: 5,
                        onChanged: (value) => eventsBloc.setPhase(quantity: int.parse(value)),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CustomFormField(
                        text: '\$ Precio *',
                        fieldType: 6,
                        onChanged: (value) => eventsBloc.setPhase(price: double.parse(value)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomGradientButton(
                      text: 'Crear',
                      onPressed: () async {
                        final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
                        final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar();

                        eventsBloc.savePhase();
                        await Future.delayed(const Duration(milliseconds: 100));
                        await eventsBloc.createPhase(context);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
