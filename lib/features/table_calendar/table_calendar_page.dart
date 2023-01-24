import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_app/constants/app_assets.dart';

class TableCalendarPage extends StatefulWidget {
  const TableCalendarPage({super.key});

  static page(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => const TableCalendarPage(),
    );
  }

  @override
  State<TableCalendarPage> createState() => _TableCalendarPageState();
}

class _TableCalendarPageState extends State<TableCalendarPage> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            locale: 'ru_RU',
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronIcon: Image.asset(AppAssets.images.arrowLeftOutlined),
              rightChevronIcon: Image.asset(AppAssets.images.arrowRightOutlined),
              leftChevronPadding: EdgeInsets.zero,
              rightChevronPadding: EdgeInsets.zero,
              leftChevronMargin: EdgeInsets.zero,
              rightChevronMargin: EdgeInsets.zero,
              headerPadding: const EdgeInsets.fromLTRB(17, 32, 14, 32),
            ),
          ),
        ],
      ),
    );
  }
}
