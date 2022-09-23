import '../../model/responses/history_list/history_response.dart';

abstract class GetHistoryRepoInterface {
  Future<HistoryResponse> getHistoryList(String id);
}
