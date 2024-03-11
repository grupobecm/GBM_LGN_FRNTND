import 'package:boletera/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/models/models.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class CreateLineUpView extends StatelessWidget {
  const CreateLineUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    eventsBloc.resetFormKey(loginFormKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Lineup del evento', style: Theme.of(context).textTheme.titleLarge),
        Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
        _LineUpListView(lineUpList: eventsBloc.state.event.lineUp!),
      ],
    );
  }
}

class _LineUpListView extends StatelessWidget {
  final List<EventLineup> lineUpList;

  const _LineUpListView({
    required this.lineUpList,
  });

  @override
  Widget build(BuildContext context) {
    return lineUpList.isEmpty
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('Crea un invitado', style: Theme.of(context).textTheme.titleLarge),
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
            itemCount: lineUpList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(lineUpList[index].name.toString()),
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
                child: CustomHorizontalCard(lineUp: lineUpList[index]),
                onDismissed: (direction) {
                  print('Dissmised'); // TODO: Eliminar de la lista
                },
              );
            },
          );
  }
}

class CreateGuestForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CreateGuestForm({
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();

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
                Text('Crear Invitado', style: Theme.of(context).textTheme.titleLarge),
                Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2, height: 60),
                CustomFormField(text: 'Nombre *', onChanged: (value) => eventsBloc.setLineup(name: value)),
                CustomFormField(text: 'Descripción', onChanged: (value) => eventsBloc.setLineup(description: value)),
                CustomFormField(text: 'Url de Web', onChanged: (value) => eventsBloc.setLineup(urlWeb: value)),
                CustomFormField(text: 'Url de Facebook', onChanged: (value) => eventsBloc.setLineup(urlFace: value)),
                CustomFormField(text: 'Url de Instagram', onChanged: (value) => eventsBloc.setLineup(urlInsta: value)),
                CustomFormField(text: 'Url de X', onChanged: (value) => eventsBloc.setLineup(urlX: value)),
                CustomImagePicker(text: 'Imagen', onChanged: (value) => eventsBloc.setLineup(image: value)),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomGradientButton(
                      text: 'Crear',
                      onPressed: () {
                        //TODO: llamar servicio crear Fase
                        eventsBloc.saveLineUp();
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
