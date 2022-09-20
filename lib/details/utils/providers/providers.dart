
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'historico_provider.dart';

final selectDaysProvider = StateProvider(
  (ref) => 5,
);

final valueCriptoProvider = StateProvider(
  (ref) => ref.watch(historicoProvider)[4].y,
);

final marketVariationProvider = StateProvider(
  (ref) =>
      ref.watch(historicoProvider)[4].y / ref.watch(historicoProvider)[3].y,
);

final historicoProvider =
    StateNotifierProvider<HistoricoProvider, List<FlSpot>>(
  (ref) => HistoricoProvider(),
);
