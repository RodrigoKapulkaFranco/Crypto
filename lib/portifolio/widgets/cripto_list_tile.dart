import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../details/utils/details_arguments.dart';
import '../../shared/model/criptoViewData.dart';
import '../../shared/utils/utils.dart';
import '../provider/utils.dart';

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: ref.watch(visibleProvider),
                replacement: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Text(
                    numberFormat.format(
                      DecimalIntl(
                        criptoViewData.userMoney(
                          userAmountCripto,
                        ),
                      ),
                    ),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                child: Text(
                  numberFormat.format(
                    DecimalIntl(
                      criptoViewData.userMoney(
                        userAmountCripto,
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${userAmountCripto.toStringAsFixed(2)} "
                "${criptoViewData.subtitle.toUpperCase()}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
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
