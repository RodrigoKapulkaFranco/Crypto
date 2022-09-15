import 'package:flutter/material.dart';

import '../../shared/repository/get_all_user_amount_cripto_local.dart';
import '../../shared/repository/get_cripto_local_repo.dart';
import '../../shared/widgets/loading.dart';
import 'cripto_list_tile.dart';
import 'total_user_money_display.dart';

class PortifolioBody extends StatelessWidget {
  const PortifolioBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: CriptoLocalRepo.getTotalBalance(),
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
            future: Future.wait(
              [
                CriptoLocalRepo.getAllCripto(),
                GetAllUserAmountCriptoLocal.getAllUserAmountCripto(),
              ],
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Loading();
              }
              return ListView.builder(
                itemCount: snapshot.data![0].length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      CriptoListTile(
                        cripto: snapshot.data![0][index],
                        userAmountCripto: snapshot.data![1][index],
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
