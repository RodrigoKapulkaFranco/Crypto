import 'package:json_annotation/json_annotation.dart';

part 'cripto_response.g.dart';

@JsonSerializable()
class CriptoResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double price_change_percentage_24h;
  CriptoResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': current_price});
    result.addAll({'price_change_percentage_24h': price_change_percentage_24h});

    return result;
  }

  factory CriptoResponse.fromMap(Map<String, dynamic> map) {
    return CriptoResponse(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      current_price: map['current_price']?.toDouble() ?? 0.0,
      price_change_percentage_24h:
          map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  factory CriptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CriptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CriptoResponseToJson(this);
}
