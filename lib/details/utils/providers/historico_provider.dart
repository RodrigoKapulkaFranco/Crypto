import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoricoProvider extends StateNotifier<List<FlSpot>> {
  final Random _random = Random();

  HistoricoProvider() : super([]) {
    for (double i = 1; i <= 90; i++) {
      state.add(
        FlSpot(i, _random.nextDouble() * 500),
      );
    }
  }
}
