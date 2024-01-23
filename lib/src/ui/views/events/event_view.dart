import 'package:boletera/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    int selectedValue1 = 0;
    int selectedValue2 = 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 600,
          height: 800,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crear Evento',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Divider(color: Theme.of(context).colorScheme.secondary),
                const SizedBox(height: 10),
                Text(
                  'Datos del evento',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 15),
                Text(
                  'Tipo de evento',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedValue1,
                      onChanged: (value) {
                        setState(() {
                          selectedValue1 = value as int;
                        });
                      },
                    ),
                    const Text('Opción 1'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: selectedValue2,
                      onChanged: (value) {
                        setState(() {
                          selectedValue2 = value as int;
                        });
                      },
                    ),
                    const Text('Opción 2'),
                  ],
                ),
                const UnderlineFormField(text: 'Nombre del Evento *'),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: UnderlineFormField(
                        text: 'Fecha y Hora Inicial del Evento *',
                        icon: Icons.event_rounded,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: UnderlineFormField(
                        text: 'Fecha y Hora Final del Evento *',
                        icon: Icons.event_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const UnderlineFormField(text: 'Descripción'),
                const SizedBox(height: 20),
                const UnderlineFormField(text: 'Ubicación'),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: UnderlineFormField(
                        text: 'Servicio',
                        icon: Icons.event_rounded,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: UnderlineFormField(
                        text: 'Visibilidad',
                        icon: Icons.event_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Text(
                //   'Fases del evento',
                //   style: Theme.of(context).textTheme.bodyMedium,
                // ),
                // const SizedBox(height: 15),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Expanded(
                //       child: UnderlineFormField(
                //         text: 'Fase',
                //         icon: Icons.event_rounded,
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //     Expanded(child: SizedBox()),
                //   ],
                // ),
                // const SizedBox(height: 20),
                // const UnderlineFormField(text: 'Descripción'),
                // const SizedBox()
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const EventCalendar(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                // maximumSize: const Size(10, 10),
                // primary: Colors.white, // Color del texto e icono
                backgroundColor: Theme.of(context).colorScheme.secondary,
// Color de fondo del botón
                elevation: 5, // Elevación del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3), // Bordes redondeados
                ),
              ),
              child: const Center(
                child: Text(
                  'Enviar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
} // TODO: Hacer vista Mobile y acomodar en sus Widgets el contenido
