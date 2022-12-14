import 'package:dio/dio.dart';

import 'i_get_cripto_endpoint.dart';

class GetCriptoEndpointImpl implements GetCriptoEndpointInterface {
  final Dio _dio;
  GetCriptoEndpointImpl(this._dio);

  @override
  Future<Response> getCriptoCoinList() {
    return _dio.get(
      'https://api.coingecko.com/api/v3/coins/markets?'
      'vs_currency=brl&ids=bitcoin%2C%20ethereum%2C%20litecoin%2C%20binancecoin%2C%20'
      'dogecoin%2C%20apecoin%2C%20ripple%2C%20flow%2C%20'
      'internet-computer%2C%20filecoin%2C%20aave%2C%20neutrino%2C%20'
      'celsius-degree-token%2C%20gatechain-token&order=market_cap_desc&per_page=100&'
      'page=1&sparkline=false',
    );
  }
}
