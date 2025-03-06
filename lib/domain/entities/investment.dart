import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment.freezed.dart';
part 'investment.g.dart';

enum AssetType { stock, bond, crypto, realEstate, cash, other }

@freezed
class Investment with _$Investment {
  const factory Investment({
    required String id,
    required String name,
    required String symbol,
    required AssetType type,
    required double currentPrice,
    required double quantity,
    required double costBasis,
    DateTime? purchaseDate,
    String? notes,
  }) = _Investment;

  factory Investment.fromJson(Map<String, dynamic> json) => _$InvestmentFromJson(json);
} 