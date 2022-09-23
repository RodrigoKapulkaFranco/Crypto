import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/providers/provider.dart';
import '../../shared/widgets/loading.dart';
import '../controller/providers.dart';
import 'total_user_money_display.dart';

class PortifolioHeader extends HookConsumerWidget {
  const PortifolioHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(
        getTotalBalanceProvider(ref.watch(userAmountProvider)).future,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }
        return TotalUserMoneyDisplay(
          userTotalMoney: snapshot.data!,
        );
      },
    );
  }
}
