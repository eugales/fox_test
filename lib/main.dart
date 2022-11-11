import 'package:flutter/material.dart';
import 'package:test_app/features/date_picker/date_picker_page.dart';
import 'package:test_app/features/table_calendar/table_calendar_page.dart';
import 'package:test_app/features/transaction_history/transaction_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 16,
          direction: Axis.vertical,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(TransactionHistoryPage.navigate(context));
              },
              child: const Text('Transaction History Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(DatePickerPage.page(context));
              },
              child: const Text('Date Picker Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(TableCalendarPage.page(context));
              },
              child: const Text('Table Calendar Page'),
            ),
          ],
        ),
      ),
    );
  }
}
