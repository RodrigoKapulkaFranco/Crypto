import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';

class TotalUserMoneyDisplay extends HookConsumerWidget {
  final Decimal userTotalMoney;
  const TotalUserMoneyDisplay({
    super.key,
    required this.userTotalMoney,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 5.0,
        top: 32.0,
        bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cripto",
                    style: TextStyle(
                      color: Color.fromRGBO(224, 43, 87, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(visibleProvider.state).state = !visible;
                    },
                    icon: visible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: visible,
                replacement: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Text(
                    numberFormat.format(
                          DecimalIntl(userTotalMoney),
                        ),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: Text(
                  numberFormat.format(
                        DecimalIntl(userTotalMoney),
                      ),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
        ],
      ),
    );
  }
}
