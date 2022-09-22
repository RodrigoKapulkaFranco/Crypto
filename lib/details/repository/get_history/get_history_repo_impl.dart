import '../../endpoint/get_history/i_get_history_endpoint.dart';
import '../../model/responses/history_list/history_response.dart';
import 'i_get_history_repo.dart';

class GetHistoryRepoImpl implements GetHistoryRepoInterface {
  final GetHistoryEndpointInterface _endpoint;
  GetHistoryRepoImpl(
    this._endpoint,
  );

  @override
  Future<HistoryResponse> getHistoryList(String id) async {
    final result = await _endpoint.getHistoryCripto(id);
    return HistoryResponse.fromJson(result.data);
  }
}
