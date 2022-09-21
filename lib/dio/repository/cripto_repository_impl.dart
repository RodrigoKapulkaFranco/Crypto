import '../endpoint/cripto_endpoint.dart';
import 'responses/cripto_coin_list/cripto_response.dart';
import 'responses/history_list/history_response.dart';

class CriptoRepositoryImpl {
  final CriptoEndpoint endpoint;
  CriptoRepositoryImpl({
    required this.endpoint,
  });

  Future<List<CriptoResponse>> getCriptoCoin() async {
    final result = await endpoint.getCriptoCoinList();
    return List<CriptoResponse>.from(
      result.data.map(
        (item) => CriptoResponse.fromMap(item),
      ),
    );
  }

  Future<HistoryResponse> getHistoryList(String id, int time) async {
    final result = await endpoint.getHistoryCripto(id, time);
    return HistoryResponse.fromJson(result.data);
  }
}
