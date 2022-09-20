import 'package:decimal/decimal.dart';

class GetAllUserAmountCriptoLocal {
  static Future<List<Decimal>> getAllUserAmountCripto() async {
    await Future.delayed(const Duration(seconds: 1));
    return userCriptoAmount;
  }

  static final List<Decimal> userCriptoAmount = [
    Decimal.parse('0.65'),
    Decimal.parse('0.94'),
    Decimal.parse('0.82'),
  ];
} 
