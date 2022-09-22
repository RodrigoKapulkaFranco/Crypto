import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_amount_provider.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

final userAmountProvider =
    StateNotifierProvider<UserAmountProvider, List<double>>(
  (ref) => UserAmountProvider(),
);
