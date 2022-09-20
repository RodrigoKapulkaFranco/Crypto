import 'package:decimal/decimal.dart';

class Cripto {
  final String title;
  final String subtitle;
  final String imagePath;
  final Decimal criptoValue;
  Cripto({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.criptoValue,
  });

  Decimal userMoney(userAmountCripto) {
    return criptoValue * userAmountCripto;
  }
}
