import 'package:flutter/material.dart';
import 'package:test_app/features/transaction_history/models/stub.dart';
import 'package:test_app/features/transaction_history/models/transaction_history_model.dart';
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
        primarySwatch: Colors.amber,
      ),
      home: Container(),
    );
  }
}
