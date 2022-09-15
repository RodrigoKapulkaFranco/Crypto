import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';

class CriptoListTile extends HookConsumerWidget {
  const CriptoListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.userMoneyBitcoin,
    required this.userAmountBitcoin,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Image image;
  final Decimal userMoneyBitcoin;
  final Decimal userAmountBitcoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: image,
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
                      DecimalIntl(userMoneyBitcoin),
                    ),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                child: Text(
                  numberFormat.format(
                    DecimalIntl(userMoneyBitcoin),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${userAmountBitcoin.toStringAsFixed(2)} BTC",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
      ),
    );
  }
}
