import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarPage extends StatelessWidget {
  const TableCalendarPage({super.key});

  static page(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => const TableCalendarPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        locale: 'ru_RU',
      ),
    );
  }
}
