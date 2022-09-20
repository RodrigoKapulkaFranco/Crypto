import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAmountProvider extends StateNotifier<List<double>> {
  final Random _random = Random();

  UserAmountProvider() : super([]) {
    for (double i = 1; i <= 14; i++) {
      state.add(_random.nextDouble());
    }
  }
}
