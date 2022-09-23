import '../responses/cripto_coin_list/cripto_response.dart';

abstract class GetCriptoRepoInterface {
  Future<List<CriptoResponse>> getCriptoCoinList();
}
