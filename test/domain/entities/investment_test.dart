import 'package:flutter_test/flutter_test.dart';
import 'package:wealth_manager_app/domain/entities/investment.dart';

void main() {
  group('Investment Entity', () {
    test('Investment object created with valid data', () {
      final investment = Investment(
        id: '1',
        name: 'Apple Inc.',
        symbol: 'AAPL',
        type: AssetType.stock,
        currentPrice: 180.95,
        quantity: 10,
        costBasis: 150.00,
      );

      expect(investment.id, '1');
      expect(investment.name, 'Apple Inc.');
      expect(investment.symbol, 'AAPL');
      expect(investment.type, AssetType.stock);
      expect(investment.currentPrice, 180.95);
      expect(investment.quantity, 10);
      expect(investment.costBasis, 150.00);
      expect(investment.notes, null);
    });

    test('Calculate investment value and return', () {
      final investment = Investment(
        id: '1',
        name: 'Apple Inc.',
        symbol: 'AAPL',
        type: AssetType.stock,
        currentPrice: 180.95,
        quantity: 10,
        costBasis: 150.00,
      );

      // Calculate current value (currentPrice * quantity)
      final currentValue = investment.currentPrice * investment.quantity;
      expect(currentValue, 1809.5);

      // Calculate total cost (costBasis * quantity)
      final totalCost = investment.costBasis * investment.quantity;
      expect(totalCost, 1500.0);

      // Calculate profit/loss
      final profitLoss = currentValue - totalCost;
      expect(profitLoss, 309.5);

      // Calculate return percentage
      final returnPercentage = (profitLoss / totalCost) * 100;
      expect(returnPercentage, closeTo(20.63, 0.01)); // 20.63%
    });
  });
} 