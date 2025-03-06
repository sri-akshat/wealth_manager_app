import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wealth_manager_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Login flow test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // App should start at splash screen
      expect(find.text('Wealth Manager'), findsOneWidget);
      
      // Wait for navigation to login screen
      await tester.pumpAndSettle(const Duration(seconds: 3));
      
      // Should be on login screen
      expect(find.text('Welcome to Wealth Manager'), findsOneWidget);
      
      // Enter login credentials
      await tester.enterText(
        find.byType(TextFormField).first, 
        'user@example.com'
      );
      await tester.enterText(
        find.byType(TextFormField).last, 
        'password'
      );
      
      // Tap login button
      await tester.tap(find.text('LOGIN'));
      await tester.pumpAndSettle();
      
      // Should navigate to dashboard
      expect(find.text('Portfolio Summary'), findsOneWidget);
    });
  });
} 