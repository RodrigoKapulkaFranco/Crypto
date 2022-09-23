import 'package:decimal/decimal.dart';

class CriptoViewData {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final Decimal criptoValue;
  final double priceChangePercentage24h;
  CriptoViewData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.criptoValue,
    required this.priceChangePercentage24h,
  });

  Decimal userMoney(userAmountCripto) {
    return criptoValue * userAmountCripto;
  }
}
