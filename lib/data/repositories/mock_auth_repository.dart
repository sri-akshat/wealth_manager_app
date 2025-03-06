import 'package:injectable/injectable.dart';
import 'package:wealth_manager_app/domain/entities/user.dart';
import 'package:wealth_manager_app/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  User? _currentUser;
  
  // List of valid users for testing
  final List<Map<String, String>> _validUsers = [
    {
      'email': 'test@example.com',
      'password': 'password',
      'name': 'Test User',
      'id': '1',
    },
    {
      'email': 'user@example.com',
      'password': 'password123',
      'name': 'Regular User',
      'id': '2',
    },
    {
      'email': 'admin@wealthmanager.com',
      'password': 'admin123',
      'name': 'Admin User',
      'id': '3',
    },
    {
      'email': 'investor@example.com',
      'password': 'invest123',
      'name': 'Investor Account',
      'id': '4',
    },
    // Add your custom credentials here
    {
      'email': 'akshat@example.com',
      'password': 'akshat123',
      'name': 'Akshat',
      'id': '5',
    },
  ];

  @override
  Future<bool> isAuthenticated() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser != null;
  }

  @override
  Future<User> getCurrentUser() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (_currentUser == null) {
      throw Exception('User not authenticated');
    }
    
    return _currentUser!;
  }

  @override
  Future<User> signIn(String email, String password) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Find user with matching credentials
    final userMatch = _validUsers.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );
    
    if (userMatch.isEmpty) {
      throw Exception('Invalid credentials');
    }
    
    // Create User object and store as current user
    _currentUser = User(
      id: userMatch['id']!,
      name: userMatch['name']!,
      email: userMatch['email']!,
    );
    
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _currentUser = null;
  }

  @override
  Future<User> signUp(String name, String email, String password) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Check if email already exists
    final existingUser = _validUsers.any((user) => user['email'] == email);
    if (existingUser) {
      throw Exception('Email already in use');
    }
    
    // Create a new user
    final newId = (_validUsers.length + 1).toString();
    
    // In a real implementation, this would persist to a database
    // For our mock, we're just creating the user in memory
    _currentUser = User(
      id: newId,
      name: name,
      email: email,
    );
    
    return _currentUser!;
  }
} 