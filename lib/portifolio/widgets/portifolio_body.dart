import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/shared/provider.dart';
import '../../shared/utils/provider/provider.dart';
import '../../shared/widgets/loading.dart';
import 'cripto_list_tile.dart';
import 'total_user_money_display.dart';

class PortifolioBody extends HookConsumerWidget {
  const PortifolioBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        FutureBuilder(
          future: ref.watch(
            totalBalanceProvider(ref.watch(userAmountProvider)).future,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Loading();
            }
            return TotalUserMoneyDisplay(
              userTotalMoney: snapshot.data!,
            );
          },
        ),
        Expanded(
          child: FutureBuilder(
            future: ref.watch(listCriptoProvider.future),
            // future: Future.wait(
            //   [
            //     CriptoLocalRepo.getAllCripto(),
            //     GetAllUserAmountCriptoLocal.getAllUserAmountCripto(),
            //   ],
            // ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Loading();
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.criptoViewDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      CriptoListTile(
                        criptoViewData:
                            snapshot.data!.criptoViewDataList[index],
                        userAmountCripto: Decimal.parse(
                          ref.watch(userAmountProvider)[index].toString(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
