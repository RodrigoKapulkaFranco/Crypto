import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'header_total_user_money.dart';
import 'visibility_money_display.dart';

class TotalUserMoneyDisplay extends HookConsumerWidget {
  final Decimal userTotalMoney;
  const TotalUserMoneyDisplay({
    super.key,
    required this.userTotalMoney,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 5.0,
        top: 32.0,
        bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTotalUserMoney(),
          const SizedBox(height: 10),
          VisibilityMoneyDisplay(
            userTotalMoney: userTotalMoney,
          ),
          const Text(
            "Valor total de moedas",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
