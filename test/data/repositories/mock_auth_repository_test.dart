import 'package:flutter_test/flutter_test.dart';
import 'package:wealth_manager_app/data/repositories/mock_auth_repository.dart';

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('MockAuthRepository', () {
    test('isAuthenticated returns false when no user is logged in', () async {
      final isAuthenticated = await authRepository.isAuthenticated();
      expect(isAuthenticated, false);
    });

    test('getCurrentUser throws exception when no user is logged in', () async {
      expect(
        () => authRepository.getCurrentUser(),
        throwsA(isA<Exception>()),
      );
    });

    test('signIn with valid credentials returns a user', () async {
      final user = await authRepository.signIn('user@example.com', 'password');
      
      expect(user.email, 'user@example.com');
      expect(user.name, 'John Doe');
      
      // Check that isAuthenticated is now true
      final isAuthenticated = await authRepository.isAuthenticated();
      expect(isAuthenticated, true);
    });

    test('signIn with invalid credentials throws an exception', () async {
      expect(
        () => authRepository.signIn('wrong@example.com', 'wrongpassword'),
        throwsA(isA<Exception>()),
      );
    });

    test('signOut clears the current user', () async {
      // First sign in
      await authRepository.signIn('user@example.com', 'password');
      
      // Then sign out
      await authRepository.signOut();
      
      // Check that user is signed out
      final isAuthenticated = await authRepository.isAuthenticated();
      expect(isAuthenticated, false);
    });

    test('signUp creates a new user with provided details', () async {
      final user = await authRepository.signUp(
        'New User',
        'new@example.com',
        'password123',
      );
      
      expect(user.name, 'New User');
      expect(user.email, 'new@example.com');
      
      // Check that isAuthenticated is now true
      final isAuthenticated = await authRepository.isAuthenticated();
      expect(isAuthenticated, true);
    });
  });
} 