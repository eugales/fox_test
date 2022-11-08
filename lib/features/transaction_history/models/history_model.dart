import 'package:test_app/features/transaction_history/models/operation.dart';

class HistoryModel {
  HistoryModel({
    required this.historyDated,
  });
  Map<String, List<Operation>> historyDated;
}
