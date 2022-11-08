enum OperationEnum { sell, buy }

class Operation {
  final OperationEnum direction;
  final String title;
  final String date;
  final double quantity;
  final String quantityCurrency;
  final String quantityCurrencySign;
  final double cost;
  final String costCurrency;
  final String costCurrencySign;
  Operation(
    this.direction,
    {
    required this.title,
    required this.date,
    required this.quantity,
    required this.quantityCurrency,
    required this.quantityCurrencySign,
    required this.cost,
    required this.costCurrency,
    required this.costCurrencySign,
  });
}
