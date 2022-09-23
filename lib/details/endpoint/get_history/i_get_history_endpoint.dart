import 'package:dio/dio.dart';

abstract class GetHistoryEndpointInterface {
  Future<Response> getHistoryCripto(String id);
}
