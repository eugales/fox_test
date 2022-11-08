import 'package:flutter/material.dart';
import 'package:test_app/features/transaction_history/models/stub.dart';
import 'package:test_app/features/transaction_history/models/history_model.dart';
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(TransactionHistoryPage.navigate(context));
          },
          child: const Text('Transaction History Page'),
        ),
      ),
    );
  }
}
