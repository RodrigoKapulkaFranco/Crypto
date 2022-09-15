import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../model/cripto.dart';
import 'get_all_user_amount_cripto_local.dart';

class CriptoLocalRepo {
  static Future<List> getAllCripto() async {
    await Future.delayed(const Duration(seconds: 1));
    return criptoCurrency;
  }

  static Future<Decimal> getTotalBalance() async {
    List temp = await GetAllUserAmountCriptoLocal.getAllUserAmountCripto();
    return (criptoCurrency[0].criptoValue * temp[0]) +
        (criptoCurrency[1].criptoValue * temp[1]) +
        (criptoCurrency[2].criptoValue * temp[2]);
  }

  static final List<Cripto> criptoCurrency = [
    Cripto(
      title: "Bitcoin",
      subtitle: "BTC",
      image: Image.asset("images/BTC.png"),
      criptoValue: Decimal.parse('109521.93'),
    ),
    Cripto(
      title: "Ethereum",
      subtitle: "ETH",
      image: Image.asset("images/ETH.png"),
      criptoValue: Decimal.parse('8316.04'),
    ),
    Cripto(
      title: "Litecoin",
      subtitle: "LTC",
      image: Image.asset("images/LTC.png"),
      criptoValue: Decimal.parse('328.57'),
    ),
  ];
}
