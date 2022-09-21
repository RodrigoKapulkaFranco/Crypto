import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/history_list_view_data.dart';
import '../endpoint/get_cripto/get_cripto_endpoint_impl.dart';
import '../endpoint/get_history/get_history_endpoint_impl.dart';
import '../repository/get_cripto/get_cripto_repo_impl.dart';
import '../repository/get_history/get_history_repo_impl.dart';
import '../usecases/get_cripto/get_cripto_usecase_impl.dart';
import '../usecases/get_history/get_history_usecase_impl.dart';
import '../usecases/get_total_balance/get_total_balance_usecase_impl.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

// Endpoints

final getCriptoEndpointProvider = StateProvider(
  (ref) => GetCriptoEndpointImpl(
    ref.watch(dioProvider),
  ),
);

final getHistoryEndpointProvider = StateProvider(
  (ref) => GetHistoryEndpointImpl(
    ref.watch(dioProvider),
  ),
);

// Repositories

final getCriptoRepoProvider = StateProvider(
  (ref) => GetCriptoRepoImpl(
    ref.watch(getCriptoEndpointProvider),
  ),
);

final getHistoryRepoProvider = StateProvider(
  (ref) => GetHistoryRepoImpl(
    ref.watch(getHistoryEndpointProvider),
  ),
);

// Usecases

final getCriptoUsecaseProvider = StateProvider(
  (ref) => GetCriptoUsecaseImpl(
    ref.watch(getCriptoRepoProvider),
  ),
);

final getHistoryUsecaseProvider = StateProvider(
  (ref) => GetHistoryUsecaseImpl(
    ref.watch(getHistoryRepoProvider),
  ),
);

final getTotalBalanceUsecaseProvider = StateProvider(
  (ref) => GetTotalBalanceUsecaseImpl(
    ref.watch(getCriptoRepoProvider),
  ),
);

// Providers

final listCriptoProvider = FutureProvider(
  (ref) => ref.watch(getCriptoUsecaseProvider).execute(),
);

final getHistoryProvider = FutureProvider.family<HistoryListViewData, String>(
  (ref, id) => ref.watch(getHistoryUsecaseProvider).execute(id),
);

final getTotalBalanceProvider = FutureProvider.family<Decimal, List<double>>(
  (ref, args) => ref.watch(getTotalBalanceUsecaseProvider).execute(args),
);
