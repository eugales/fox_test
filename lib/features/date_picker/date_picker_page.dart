import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  static page(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return const DatePickerPage();
      },
    );
  }

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  final _selectedDate = DateTime.now();
  final datePickerController = DatePickerController();

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: DatePicker(
              _selectedDate.subtract(const Duration(days: 30)),
              initialSelectedDate: _selectedDate,
              dateTextStyle: defaultDateTextStyle,
              selectionColor: const Color(0xFF7288FA),
              locale: 'ru_RU',
              controller: datePickerController,
            ),
          )
        ],
      ),
    );
  }
}
