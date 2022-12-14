import '../../model/history_list_view_data.dart';
import '../../model/responses/history_list/history_response.dart';
import '../../repository/get_history/i_get_history_repo.dart';
import '../../utils/mapper/list_history_mapper.dart';
import 'i_get_history_usecase.dart';

class GetHistoryUsecaseImpl implements GetHistoryUsecaseInterface {
  final GetHistoryRepoInterface _repository;
  GetHistoryUsecaseImpl(
    this._repository,
  );

  @override
  Future<HistoryListViewData> execute(String id) async {
    HistoryResponse response = await _repository.getHistoryList(id);
    return response.toViewData();
  }
}
