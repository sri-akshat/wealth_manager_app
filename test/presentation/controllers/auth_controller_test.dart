import 'package:flutter_test/flutter_test.dart';
import 'package:wealth_manager_app/domain/entities/user.dart';
import 'package:wealth_manager_app/domain/repositories/auth_repository.dart';
import 'package:wealth_manager_app/presentation/controllers/auth_controller.dart';

// Create a simple test implementation of AuthRepository
class TestAuthRepository implements AuthRepository {
  bool _isAuthenticated = false;
  User? _currentUser;

  void setAuthenticated(bool value, {User? user}) {
    _isAuthenticated = value;
    _currentUser = user;
  }

  @override
  Future<User> getCurrentUser() async {
    if (_currentUser == null) {
      throw Exception('User not authenticated');
    }
    return _currentUser!;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _isAuthenticated;
  }

  @override
  Future<User> signIn(String email, String password) async {
    if (email == 'test@example.com' && password == 'password') {
      _currentUser = User(
        id: '1',
        name: 'Test User',
        email: email,
      );
      _isAuthenticated = true;
      return _currentUser!;
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
    _isAuthenticated = false;
  }

  @override
  Future<User> signUp(String name, String email, String password) async {
    _currentUser = User(
      id: '1',
      name: name,
      email: email,
    );
    _isAuthenticated = true;
    return _currentUser!;
  }
}

void main() {
  late TestAuthRepository authRepository;
  late AuthController authController;

  setUp(() {
    authRepository = TestAuthRepository();
    authController = AuthController(authRepository);
  });

  test('Initial state should be loading', () {
    expect(authController.state.isLoading, true);
  });

  group('signIn', () {
    test('should update state with user when successful', () async {
      // Act
      await authController.signIn('test@example.com', 'password');

      // Assert
      expect(authController.state.hasValue, true);
      expect(authController.state.value?.email, 'test@example.com');
    });

    test('should update state with error when unsuccessful', () async {
      // Act
      try {
        await authController.signIn('wrong@example.com', 'wrong');
      } catch (_) {
        // Ignore the exception
      }

      // Assert
      expect(authController.state.hasError, true);
    });
  });
} 