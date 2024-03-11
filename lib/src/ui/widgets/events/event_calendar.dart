// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  final CalendarController _controller = CalendarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 650,
      height: 500,
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              _RectangularButton(
                icon: Icons.keyboard_arrow_left_outlined,
                type: 0,
                width: 64,
                function: () {
                  setState(() {
                    _controller.backward!();
                  });
                },
              ),
              _RectangularButton(
                icon: Icons.keyboard_arrow_right_outlined,
                type: 0,
                width: 64,
                function: () {
                  setState(() {
                    _controller.forward!();
                  });
                },
              ),
              const SizedBox(width: 5),
              _RectangularButton(
                text: 'Hoy',
                type: 1,
                width: 64,
                function: () {
                  setState(() {
                    final DateTime today = DateTime.now();
                    _controller.displayDate = today;
                    _controller.selectedDate = today;
                  });
                },
              ),
              const SizedBox(width: 200),
              _RectangularButton(
                text: 'Día',
                type: 0,
                width: 64,
                function: () {
                  setState(() {
                    _controller.view = CalendarView.day;
                  });
                },
              ),
              _RectangularButton(
                text: 'Semana',
                type: 0,
                width: 80,
                function: () {
                  setState(() {
                    _controller.view = CalendarView.week;
                  });
                },
              ),
              _RectangularButton(
                text: 'Mes',
                type: 2,
                width: 64,
                function: () {
                  setState(() {
                    _controller.view = CalendarView.month;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          getCalendar(_controller)
        ],
      ),
    );
  }

  SfCalendar getCalendar(CalendarController controller) {
    return SfCalendar(
      controller: controller,
      view: CalendarView.month,
      todayTextStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),
      selectionDecoration: BoxDecoration(
        color: Colors.transparent, // Color de fondo
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary, // Color del borde
          width: 3.0, // Ancho del borde
        ),
      ),
    );
  }
}

class _RectangularButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final int type;
  final double width;
  final Function()? function;

  const _RectangularButton({
    this.text,
    this.icon,
    this.function,
    required this.type,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
        maximumSize: Size(width, 40),
        // primary: Colors.white, // Color del texto e icono
        backgroundColor: type == 0
            ? Theme.of(context).colorScheme.secondary
            : type == 1
                ? Theme.of(context).colorScheme.inverseSurface
                : Theme.of(context).colorScheme.inversePrimary, // Color de fondo del botón
        elevation: 5, // Elevación del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // Bordes redondeados
        ),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: Colors.white)
            : Text(
                text!,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
