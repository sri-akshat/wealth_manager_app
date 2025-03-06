// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentImpl _$$InvestmentImplFromJson(Map<String, dynamic> json) =>
    _$InvestmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      type: $enumDecode(_$AssetTypeEnumMap, json['type']),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      costBasis: (json['costBasis'] as num).toDouble(),
      purchaseDate: json['purchaseDate'] == null
          ? null
          : DateTime.parse(json['purchaseDate'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InvestmentImplToJson(_$InvestmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'type': _$AssetTypeEnumMap[instance.type]!,
      'currentPrice': instance.currentPrice,
      'quantity': instance.quantity,
      'costBasis': instance.costBasis,
      'purchaseDate': instance.purchaseDate?.toIso8601String(),
      'notes': instance.notes,
    };

const _$AssetTypeEnumMap = {
  AssetType.stock: 'stock',
  AssetType.bond: 'bond',
  AssetType.crypto: 'crypto',
  AssetType.realEstate: 'realEstate',
  AssetType.cash: 'cash',
  AssetType.other: 'other',
};
