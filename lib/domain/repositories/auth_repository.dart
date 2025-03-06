import 'package:wealth_manager_app/domain/entities/user.dart';

abstract class AuthRepository {
  /// Checks if a user is currently authenticated
  Future<bool> isAuthenticated();
  
  /// Gets the currently authenticated user
  /// Throws an exception if no user is authenticated
  Future<User> getCurrentUser();
  
  /// Signs in with email and password
  /// Returns the authenticated user or throws an exception
  Future<User> signIn(String email, String password);
  
  /// Signs out the current user
  Future<void> signOut();
  
  /// Creates a new user and signs them in
  /// Returns the newly created user or throws an exception
  Future<User> signUp(String name, String email, String password);
} 