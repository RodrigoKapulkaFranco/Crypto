import 'package:dio/dio.dart';

import 'i_get_history_endpoint.dart';

class GetHistoryEndpointImpl implements GetHistoryEndpointInterface {
  final Dio _dio;
  GetHistoryEndpointImpl(this._dio);

  @override
  Future<Response> getHistoryCripto(String id) {
    return _dio.get(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=brl&days=90&interval=daily');
  }
}
