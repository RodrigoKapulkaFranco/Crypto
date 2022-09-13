import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import 'portifolio_body.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAmountBitcoin = Decimal.parse('0.65');
    final userAmountEthereum = Decimal.parse('0.94');
    final userAmountlitecoin = Decimal.parse('0.82');

    // Valores de 13/09/222
    final bitcoinValue = Decimal.parse('109521.93');
    final ethereumValue = Decimal.parse('8316.04');
    final litecoinValue = Decimal.parse('328.57');

    final userMoneyBitcoin = userAmountBitcoin * bitcoinValue;
    final userMoneyEthereum = userAmountEthereum * ethereumValue;
    final userMoneylitecoin = userAmountlitecoin * litecoinValue;

    final userTotalMoney =
        userMoneyBitcoin + userMoneyEthereum + userAmountlitecoin;

    return PortifolioBody(
      userTotalMoney: userTotalMoney,
      userMoneyBitcoin: userMoneyBitcoin,
      userAmountBitcoin: userAmountBitcoin,
      userMoneyEthereum: userMoneyEthereum,
      userAmountEthereum: userAmountEthereum,
      userMoneylitecoin: userMoneylitecoin,
      userAmountlitecoin: userAmountlitecoin,
    );
  }
}
