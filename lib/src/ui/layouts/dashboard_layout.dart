import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.shadow,
        title: Image.asset(
          'assets/images/logo_black.png',
          scale: 13,
        ),
        elevation: 5,
      ),
      body: Row(
        children: [
          SfCalendar(
            view: CalendarView.month,
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 9,
              endHour: 16,
              nonWorkingDays: <int>[
                DateTime.friday,
                DateTime.saturday,
              ],
            ),
          )
        ],
      ),
    );
  }
}
