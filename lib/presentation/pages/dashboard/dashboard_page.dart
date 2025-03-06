import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealth_manager_app/core/router/app_router.dart';
import 'package:wealth_manager_app/presentation/controllers/auth_controller.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    
    return authState.when(
      data: (user) {
        if (user == null) {
          // If not authenticated, navigate to login
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.router.replace(const LoginRoute());
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        return AutoTabsRouter(
          routes: const [
            DashboardHomeRoute(),
            InvestmentsRoute(),
            TransactionsRoute(),
            ProfileRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            
            return Scaffold(
              appBar: AppBar(
                title: const Text('Wealth Manager'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await ref.read(authControllerProvider.notifier).signOut();
                    },
                    tooltip: 'Sign Out',
                  ),
                ],
              ),
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                type: BottomNavigationBarType.fixed,
                onTap: tabsRouter.setActiveIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up),
                    label: 'Investments',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long),
                    label: 'Transactions',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
              floatingActionButton: _buildFloatingActionButton(tabsRouter, context),
            );
          },
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
  
  Widget? _buildFloatingActionButton(TabsRouter tabsRouter, BuildContext context) {
    if (tabsRouter.activeIndex == 1) {
      return FloatingActionButton(
        onPressed: () => context.router.push(const InvestmentDetailsRoute()),
        child: const Icon(Icons.add),
      );
    } else if (tabsRouter.activeIndex == 2) {
      return FloatingActionButton(
        onPressed: () => context.router.push(const AddTransactionRoute()),
        child: const Icon(Icons.add),
      );
    }
    return null;
  }
}