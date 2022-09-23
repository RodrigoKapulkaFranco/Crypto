import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../details/utils/details_arguments.dart';
import '../model/cripto_view_data.dart';
import 'trailing_list_tile.dart';

class CriptoListTile extends HookConsumerWidget {
  const CriptoListTile({
    Key? key,
    required this.criptoViewData,
    required this.userAmountCripto,
  }) : super(key: key);

  final CriptoViewData criptoViewData;
  final Decimal userAmountCripto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(criptoViewData.imagePath),
      ),
      trailing: TrailingListTile(
        criptoViewData: criptoViewData,
        userAmountCripto: userAmountCripto,
      ),
      title: Text(
        criptoViewData.title,
        style: const TextStyle(fontSize: 25),
      ),
      subtitle: Text(
        criptoViewData.subtitle.toUpperCase(),
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          "/details",
          arguments: DetailsArguments(
            cripto: criptoViewData,
            userAmountCripto: userAmountCripto,
          ),
        );
      },
    );
  }
}
