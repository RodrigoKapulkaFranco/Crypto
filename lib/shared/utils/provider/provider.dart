import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'historico_provider.dart';

final userAmountProvider =
    StateNotifierProvider<UserAmountProvider, List<double>>(
  (ref) => UserAmountProvider(),
);
