import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealth_manager_app/domain/entities/user.dart';
import 'package:wealth_manager_app/presentation/controllers/auth_controller.dart';
import 'package:wealth_manager_app/presentation/pages/auth/login_page.dart';

// For simplicity, let's avoid using mockito in this test initially
void main() {
  testWidgets('LoginPage displays form correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    // Verify that LoginPage shows the expected widgets
    expect(find.text('Welcome to Wealth Manager'), findsOneWidget);
    expect(find.byType(TextFormField), findsAtLeast(2)); // Email and password fields
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
} 