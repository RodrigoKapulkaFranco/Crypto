import 'package:dio/dio.dart';

abstract class GetCriptoEndpointInterface {
  Future<Response> getCriptoCoinList();
}
