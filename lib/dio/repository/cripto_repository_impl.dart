import '../endpoint/cripto_endpoint.dart';
import 'responses/cripto_response.dart';

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
}
