import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class Cripto {
  final String title;
  final String subtitle;
  final Image image;
  final Decimal criptoValue;
  Cripto({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.criptoValue,
  });

  Decimal userMoney(userAmountCripto) {
    return criptoValue * userAmountCripto;
  }
}
