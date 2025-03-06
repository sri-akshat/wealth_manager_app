import 'package:wealth_manager_app/domain/entities/investment.dart';

abstract class InvestmentRepository {
  Future<List<Investment>> getInvestments();
  Future<Investment> getInvestment(String id);
  Future<Investment> addInvestment(Investment investment);
  Future<Investment> updateInvestment(Investment investment);
  Future<void> deleteInvestment(String id);
} 