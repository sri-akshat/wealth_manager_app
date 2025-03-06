import 'package:get_it/get_it.dart';
import 'package:wealth_manager_app/data/repositories/mock_auth_repository.dart';
import 'package:wealth_manager_app/domain/repositories/auth_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => MockAuthRepository());
  
  // Add other repositories and services here as needed
  // Example:
  // getIt.registerLazySingleton<InvestmentRepository>(() => MockInvestmentRepository());
} 