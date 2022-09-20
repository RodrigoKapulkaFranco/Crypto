import 'package:json_annotation/json_annotation.dart';

part 'history_response.g.dart';

@JsonSerializable()
class HistoryResponse {
  final List<List<double>> prices;
  HistoryResponse({
    required this.prices,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);
}
