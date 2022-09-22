import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/providers/provider.dart';
import '../endpoint/get_history/get_history_endpoint_impl.dart';
import '../model/history_list_view_data.dart';
import '../repository/get_history/get_history_repo_impl.dart';
import '../usecases/get_history/get_history_usecase_impl.dart';

// Endpoints

final getHistoryEndpointProvider = StateProvider(
  (ref) => GetHistoryEndpointImpl(
    ref.watch(dioProvider),
  ),
);

// Repositories

final getHistoryRepoProvider = StateProvider(
  (ref) => GetHistoryRepoImpl(
    ref.watch(getHistoryEndpointProvider),
  ),
);

// Usecases

final getHistoryUsecaseProvider = StateProvider(
  (ref) => GetHistoryUsecaseImpl(
    ref.watch(getHistoryRepoProvider),
  ),
);

// Providers

final getHistoryProvider = FutureProvider.family<HistoryListViewData, String>(
  (ref, id) => ref.watch(getHistoryUsecaseProvider).execute(id),
);
