import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/history_list_view_data.dart';
import '../endpoint/cripto_endpoint.dart';
import '../repository/cripto_repository_impl.dart';
import '../usecases/get_history_list.dart';
import '../usecases/get_list_cripto_usecase.dart';
import '../usecases/get_total_balance.dart';

Dio teste = Dio();
final dioProvider = Provider(
  (ref) => teste,
);

final criptoEndpointProvider = StateProvider((ref) {
  final dio = ref.read(dioProvider);
  return CriptoEndpoint(dio);
});

final criptoRepositoryProvider = Provider(
  (ref) => CriptoRepositoryImpl(
    endpoint: ref.watch(
      criptoEndpointProvider,
    ),
  ),
);

final getListCriptoCoinUsecase = Provider(
  (ref) => GetListCriptoCoinUsecase(
    repository: ref.watch(
      criptoRepositoryProvider,
    ),
  ),
);
final getTotalBalanceUsecase = Provider(
  (ref) => GetTotalBalanceUsecase(
    repository: ref.watch(
      criptoRepositoryProvider,
    ),
  ),
);

final getHistoryListUsecase = Provider(
  (ref) => GetHistoryListUsecase(
    repository: ref.watch(
      criptoRepositoryProvider,
    ),
  ),
);

final historyListProvider = FutureProvider.family<HistoryListViewData, String>(
  (ref, id) => ref.watch(getHistoryListUsecase).execute(id),
);

final listCriptoProvider = FutureProvider(
  (ref) => ref.watch(getListCriptoCoinUsecase).execute(),
);
final totalBalanceProvider = FutureProvider.family<Decimal, List<double>>(
  (ref, args) => ref.watch(getTotalBalanceUsecase).execute(args),
);