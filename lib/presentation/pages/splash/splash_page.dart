import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealth_manager_app/core/router/app_router.dart';
import 'package:wealth_manager_app/presentation/controllers/auth_controller.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Reduced delay for better UX
    Future.delayed(const Duration(seconds: 2), _navigateToNextScreen);
  }

  Future<void> _navigateToNextScreen() async {
    try {
      // Ensure authentication check happens
      await ref.read(authControllerProvider.notifier).checkAuthentication();
      
      // Force navigate to login for now, just to make sure navigation works
      if (mounted) {
        // Using replace instead of pushReplacement
        context.router.replace(const LoginRoute());
      }
    } catch (e) {
      print('Error during navigation: $e');
      if (mounted) {
        context.router.replace(const LoginRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.account_balance_wallet, size: 150),
            ),
            const SizedBox(height: 24),
            const Text(
              'Wealth Manager',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
} 