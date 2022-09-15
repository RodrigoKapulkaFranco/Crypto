import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import 'cripto_list_tile.dart';
import 'total_user_money_display.dart';

class PortifolioBody extends StatelessWidget {
  const PortifolioBody({
    Key? key,
    required this.userTotalMoney,
    required this.userMoneyBitcoin,
    required this.userAmountBitcoin,
    required this.userMoneyEthereum,
    required this.userAmountEthereum,
    required this.userMoneylitecoin,
    required this.userAmountlitecoin,
  }) : super(key: key);

  final Decimal userTotalMoney;
  final Decimal userMoneyBitcoin;
  final Decimal userAmountBitcoin;
  final Decimal userMoneyEthereum;
  final Decimal userAmountEthereum;
  final Decimal userMoneylitecoin;
  final Decimal userAmountlitecoin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TotalUserMoneyDisplay(
            userTotalMoney: userTotalMoney,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                CriptoListTile(
                  title: "BTC",
                  subtitle: "Bitcoin",
                  image: Image.asset("images/BTC.png"),
                  userMoneyBitcoin: userMoneyBitcoin,
                  userAmountBitcoin: userAmountBitcoin,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                CriptoListTile(
                  title: "ETH",
                  subtitle: "Ethereum",
                  image: Image.asset("images/ETH.png"),
                  userMoneyBitcoin: userMoneyEthereum,
                  userAmountBitcoin: userAmountEthereum,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                CriptoListTile(
                  title: "LTC",
                  subtitle: "Litecoin",
                  image: Image.asset("images/LTC.png"),
                  userMoneyBitcoin: userMoneylitecoin,
                  userAmountBitcoin: userAmountlitecoin,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
