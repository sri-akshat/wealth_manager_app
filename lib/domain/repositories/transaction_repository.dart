import 'package:wealth_manager_app/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
  Future<List<Transaction>> getTransactionsForInvestment(String investmentId);
  Future<Transaction> getTransaction(String id);
  Future<Transaction> addTransaction(Transaction transaction);
  Future<Transaction> updateTransaction(Transaction transaction);
  Future<void> deleteTransaction(String id);
} 