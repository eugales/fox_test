import 'package:flutter/material.dart';
import 'package:test_app/constants/app_assets.dart';
import 'package:test_app/constants/app_styles.dart';
import 'package:test_app/features/transaction_history/models/operation.dart';

class OperationItem extends StatelessWidget {
  const OperationItem({super.key, required this.operation});

  final Operation operation;

  bool get isBuy => operation.direction == OperationEnum.buy;

  String get spentText =>
      '${isBuy ? '+' : '-'} ${operation.quantity.toStringAsFixed(2)} ${operation.quantityCurrency}';
  String get incomeText =>
      '${isBuy ? '+' : '-'} ${operation.costCurrencySign}${operation.cost.toStringAsFixed(2)} ${operation.costCurrency}';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        isBuy ? AppAssets.images.plus : AppAssets.images.minus,
      ),
      title: Text(operation.title, style: AppStyles.s16w400),
      subtitle: Text(operation.date, style: AppStyles.s10w400),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            spentText,
            style: AppStyles.s15w400,
          ),
          const SizedBox(height: 4),
          Text(incomeText, style: AppStyles.s15w400),
        ],
      ),
    );
  }
}
