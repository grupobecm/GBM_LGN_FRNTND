import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String text;
  final IconData icon;

  const MenuButton({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  late bool isHovered;

  @override
  void initState() {
    isHovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: () => NavigationService.replaceTo(selctRoute()),
        style: ButtonStyle(
          // minimumSize: const MaterialStatePropertyAll(Size(150, 30)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // Cambiar el color al pasar el ratón por encima
              return isHovered ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary;
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon), // Reemplaza "your_icon" con el icono que desees
            const SizedBox(width: 10), // Espacio entre el icono y el texto
            Text(widget.text),
          ],
        ),
      ),
    );
  }

  String selctRoute() {
    if (widget.text == 'Events') return Flurorouter.eventsRoute;
    // if (widget.text == 'Create Event') return Flurorouter.eventRoute;
    // if (widget.text == 'Update Event') return Flurorouter.updatEeventRoute;

    return Flurorouter.eventsRoute;
  }
}
