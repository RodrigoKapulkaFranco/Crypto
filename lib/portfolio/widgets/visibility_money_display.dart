import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/utils.dart';
import '../utils/visible_provider.dart';

class VisibilityMoneyDisplay extends HookConsumerWidget {
  const VisibilityMoneyDisplay({
    Key? key,
    required this.userTotalMoney,
  }) : super(key: key);

  final Decimal userTotalMoney;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    return Visibility(
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
    );
  }
}
