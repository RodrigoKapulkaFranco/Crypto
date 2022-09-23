import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/providers/provider.dart';
import '../../shared/widgets/loading.dart';
import '../controller/providers.dart';
import 'cripto_list_tile.dart';

class ListViewCripto extends HookConsumerWidget {
  const ListViewCripto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: FutureBuilder(
        future: ref.watch(listCriptoProvider.future),
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
                    criptoViewData: snapshot.data!.criptoViewDataList[index],
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
    );
  }
}
