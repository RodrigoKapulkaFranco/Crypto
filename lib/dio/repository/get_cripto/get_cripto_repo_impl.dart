import '../../endpoint/get_cripto/i_get_cripto_endpoint.dart';
import '../responses/cripto_coin_list/cripto_response.dart';
import 'i_get_cripto_repo.dart';

class GetCriptoRepoImpl implements GetCriptoRepoInterface {
  final GetCriptoEndpointInterface _endpoint;
  GetCriptoRepoImpl(
    this._endpoint,
  );

  @override
  Future<List<CriptoResponse>> getCriptoCoinList() async {
    final result = await _endpoint.getCriptoCoinList();
    return List<CriptoResponse>.from(
      result.data.map(
        (item) => CriptoResponse.fromMap(item),
      ),
    );
  }
}
