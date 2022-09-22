import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/utils.dart';
import '../model/cripto_view_data.dart';
import '../utils/visible_provider.dart';

class TrailingListTile extends HookConsumerWidget {
  const TrailingListTile({
    Key? key,
    required this.criptoViewData,
    required this.userAmountCripto,
  }) : super(key: key);

  final CriptoViewData criptoViewData;
  final Decimal userAmountCripto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
    );
  }
}
