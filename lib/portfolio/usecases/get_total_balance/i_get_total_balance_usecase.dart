import 'package:decimal/decimal.dart';

abstract class GetTotalBalanceUsecaseInterface {
  Future<Decimal> execute(List<double> userAmountsCripto);
}
