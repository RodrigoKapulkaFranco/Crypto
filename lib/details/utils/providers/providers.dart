import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'historico_provider.dart';

final selectDaysProvider = StateProvider(
  (ref) => 5,
);

final historicoProvider =
    StateNotifierProvider<HistoricoProvider, List<FlSpot>>(
  (ref) => HistoricoProvider(),
);
