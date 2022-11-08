import 'package:test_app/features/transaction_history/models/operation.dart';

final operations = [
  Operation(
    OperationEnum.sell,
    title: 'Sell DOT',
    date: '1/24/2022',
    quantity: 10,
    quantityCurrency: 'DOT',
    quantityCurrencySign: '',
    cost: 189.82,
    costCurrency: 'USD',
    costCurrencySign: '\$',
  ),
  Operation(
    OperationEnum.sell,
    title: 'Sell DOT',
    date: '1/24/2022',
    quantity: 10,
    quantityCurrency: 'DOT',
    quantityCurrencySign: '',
    cost: 189.82,
    costCurrency: 'USD',
    costCurrencySign: '\$',
  ),
  Operation(
    OperationEnum.buy,
    title: 'Buy BTC',
    date: '1/24/2022',
    quantity: 1,
    quantityCurrency: 'BTC',
    quantityCurrencySign: '',
    cost: 44978.25,
    costCurrency: 'USD',
    costCurrencySign: '\$',
  ),
  Operation(
    OperationEnum.sell,
    title: 'Sell DOT',
    date: '1/24/2022',
    quantity: 10,
    quantityCurrency: 'DOT',
    quantityCurrencySign: '',
    cost: 189.82,
    costCurrency: 'USD',
    costCurrencySign: '\$',
  )
];

final historyStub = {
  'Yesterday': operations,
  'Monday': operations,
  'Wendesday': operations,
  'Thursday, Dec 9, 2021': operations,
  'Wednesday, Dec 8, 2021': operations
};
