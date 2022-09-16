import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/providers/providers.dart';

class LineChartButton extends HookConsumerWidget {
  final int days;
  const LineChartButton({
    Key? key,
    required this.days,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectDays = ref.watch(selectDaysProvider);
    return MaterialButton(
      color: selectDays == days ? Colors.grey.shade300 : null,
      textColor: Colors.black,
      padding: const EdgeInsets.all(0),
      minWidth: 30,
      height: 25,
      onPressed: () {
        ref.read(selectDaysProvider.state).state = days;
      },
      child: Text(
        "${days}D",
        style: TextStyle(
          color: selectDays == days ? null : Colors.black45,
        ),
      ),
    );
  }
}
