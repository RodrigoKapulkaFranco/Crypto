// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cripto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriptoResponse _$CriptoResponseFromJson(Map<String, dynamic> json) =>
    CriptoResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      current_price: (json['current_price'] as num).toDouble(),
      price_change_percentage_24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CriptoResponseToJson(CriptoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.current_price,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
    };
