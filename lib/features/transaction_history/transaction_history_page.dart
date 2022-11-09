import 'package:flutter/material.dart';
import 'package:test_app/features/transaction_history/models/stub.dart';
import 'package:test_app/features/transaction_history/models/history_model.dart';

import 'package:test_app/features/transaction_history/widgets/operation_item.dart';
import 'package:test_app/features/transaction_history/widgets/th_header_delegate.dart';
import 'package:test_app/features/transaction_history/widgets/th_app_bar.dart';
import 'package:test_app/features/transaction_history/widgets/th_sort_header/th_sort_header.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key, required this.history});

  final HistoryModel history;

  static navigate(BuildContext context) {
    final history = HistoryModel(historyDated: historyStub);

    return MaterialPageRoute(
      builder: (context) => TransactionHistoryPage(history: history),
    );
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: THHeaderDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
          color: const Color(0xFFF3F3F3),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(headerText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const THAppBar(),
          const THSortHeader(),
          for (var map in history.historyDated.entries) ...[
            makeHeader(map.key),
            SliverList(
              delegate: SliverChildListDelegate(
                  map.value.map((o) => OperationItem(operation: o)).toList()),
            ),
          ]
        ],
      ),
    );
  }
}
