import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum TransactionType { buy, sell, dividend, deposit, withdrawal, fee, interest }

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String investmentId,
    required TransactionType type,
    required double amount,
    required double quantity,
    required double price,
    required DateTime date,
    String? notes,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
} 