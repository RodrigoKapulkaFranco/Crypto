import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/providers/provider.dart';
import '../endpoint/get_cripto/get_cripto_endpoint_impl.dart';
import '../repository/get_cripto/get_cripto_repo_impl.dart';
import '../usecases/get_cripto/get_cripto_usecase_impl.dart';
import '../usecases/get_total_balance/get_total_balance_usecase_impl.dart';

final getCriptoEndpointProvider = StateProvider(
  (ref) => GetCriptoEndpointImpl(
    ref.watch(dioProvider),
  ),
);

// Repositories

final getCriptoRepoProvider = StateProvider(
  (ref) => GetCriptoRepoImpl(
    ref.watch(getCriptoEndpointProvider),
  ),
);

// Usecases

final getCriptoUsecaseProvider = StateProvider(
  (ref) => GetCriptoUsecaseImpl(
    ref.watch(getCriptoRepoProvider),
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

final getTotalBalanceProvider = FutureProvider.family<Decimal, List<double>>(
  (ref, args) => ref.watch(getTotalBalanceUsecaseProvider).execute(args),
);
