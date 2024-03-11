import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class EditGeneralData extends StatelessWidget {
  const EditGeneralData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: (size.width > 1000) ? const _DesktopView() : const _MobileView(),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGradientButton(
                  onPressed: () => NavigationService.goBack(),
                  text: 'Regresar',
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
                const CustomSwitch(text: 'Activar venta'),
                const CustomSwitch(text: 'Evento Privado'),
                const CustomSwitch(text: 'Evento para mayores de edad'),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: size.width * 0.9, minHeight: size.height * 0.6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Color de la sombra
                    spreadRadius: 5, // Radio de expansión de la sombra
                    blurRadius: 7, // Radio de desenfoque de la sombra
                    offset: const Offset(0, 3), // Desplazamiento de la sombra en dirección Y
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(child: eventsBloc.getImage(url: eventsBloc.state.event.bannerImage)),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                          Theme.of(context).colorScheme.shadow.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 70),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: size.width * 0.30, maxHeight: size.height * 0.35),
                          child: Container(
                            width: double.infinity,
                            height: size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent,
                            ),
                            child: eventsBloc.getImage(url: eventsBloc.state.event.image),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Nombre del Evento:',
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              eventsBloc.state.event.eventName!,
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Ubicación del Evento:',
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              eventsBloc.state.event.location!,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Fecha y Hora del Evento:',
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              DateFormat('EEEE d \'de\' MMMM \'del\' yyyy', 'es')
                                  .format(DateTime.parse(eventsBloc.state.event.startDate!)),
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomFlatButton(
                icon: Icons.edit,
                text: 'Editar Evento',
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {
                  //TODO: Poner funcion
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text('Line up', style: Theme.of(context).textTheme.titleLarge),
                const Spacer(flex: 2),
                CustomOutlinedButton(
                  icon: Icons.delete,
                  text: 'Eliminar Line up',
                  onPressed: () {},
                ),
                const SizedBox(width: 15),
                CustomGradientButton(
                  icon: Icons.add,
                  text: 'Agregar Invitado',
                  isRectangular: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Acerca del evento', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Text(eventsBloc.state.event.description!, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 20),
          Text('Ubicación', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Text(eventsBloc.state.event.location!, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 20),
          Divider(color: Theme.of(context).colorScheme.inverseSurface),
          const SizedBox(height: 20),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: size.width * 0.7, maxWidth: size.width * 0.7, minHeight: 500),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color de la sombra
                      spreadRadius: 5, // Radio de expansión de la sombra
                      blurRadius: 7, // Radio de desenfoque de la sombra
                      offset: const Offset(0, 3), // Desplazamiento de la sombra en dirección Y
                    ),
                  ],
                ),
                child: const Center(child: Text('Google Maps', style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsBloc eventsBloc = context.watch<EventsBloc>();

    return Container();
  }
}
