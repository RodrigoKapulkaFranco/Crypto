import '../../shared/model/history_list_view_data.dart';
import '../repository/cripto_repository_impl.dart';
import '../repository/responses/history_list/history_response.dart';
import '../shared/list_history_mapper.dart';

class GetHistoryListUsecase {
  final CriptoRepositoryImpl repository;
  GetHistoryListUsecase({
    required this.repository,
  });

  Future<HistoryListViewData> execute(String id, int time) async {
    HistoryResponse response = await repository.getHistoryList(id, time);
    return response.toViewData();
  }
}
