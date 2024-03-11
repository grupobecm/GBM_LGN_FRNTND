import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/ui/widgets/custom_gradient_button.dart';
import 'package:boletera/src/ui/widgets/custom_image_picker.dart';
import 'package:boletera/src/ui/widgets/custom_outlined_button.dart';

class EditTicketView extends StatelessWidget {
  const EditTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return (size.width > 1000) ? const _DesktopView() : const _MobileView();
  }
}

class _DesktopView extends StatefulWidget {
  const _DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  State<_DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<_DesktopView> {
  Color _selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 80, top: 80, bottom: 80),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800, minWidth: 600),
                child: Card(
                  child: SizedBox(
                    height: 800,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personaliza el ticket para tu evento',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Puedes modificar el color de fondo o subir una imagen para que el ticket quede personalizado para tu evento.',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Color de fondo',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          Text('Selecciona un color', style: Theme.of(context).textTheme.labelMedium),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            ColorItem(color: Colors.red, onColorSelected: _onColorSelected),
                                            ColorItem(color: Colors.green, onColorSelected: _onColorSelected),
                                            ColorItem(color: Colors.blue, onColorSelected: _onColorSelected),
                                            ColorItem(color: Colors.yellow, onColorSelected: _onColorSelected),
                                            ColorItem(color: Colors.orange, onColorSelected: _onColorSelected),
                                            ColorItem(color: Colors.purple, onColorSelected: _onColorSelected),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _selectedColor,
                              ),
                              child: const Text('Seleccionar color'),
                            ),
                            const SizedBox(height: 60),
                            Text(
                              'Subir imagen de fondo',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 10),
                            CustomImagePicker(
                              text: 'Subir Imagen',
                              onChanged: () {},
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'La imagen debe ser formato .jpg o .png, la medida recomendada es de 800px * 600px, no mayor a 7 Mb.',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(height: 80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomOutlinedButton(
                                  text: 'Vista Previa',
                                  onPressed: () {},
                                ),
                                CustomGradientButton(
                                  text: 'Guardar Diseño',
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(width: 50),
            ),
            Card(
              color: _selectedColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: SizedBox(
                height: 600,
                width: 300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/ticket.png'),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(width: 50),
            ),
          ],
        ),
      ),
    );
  }

  void _onColorSelected(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final Function(Color) onColorSelected;

  const ColorItem({super.key, required this.color, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onColorSelected(color);
        Navigator.of(context).pop();
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.all(4),
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
    // final EventsBloc eventsBloc = context.watch<EventsBloc>();

    return Container();
  }
}
