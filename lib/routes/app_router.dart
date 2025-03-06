import 'package:auto_route/auto_route.dart';

import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/register_page.dart';
import '../presentation/pages/dashboard/dashboard_page.dart';
import '../presentation/pages/investments/investment_details_page.dart';
import '../presentation/pages/investments/investments_page.dart';
import '../presentation/pages/profile/profile_page.dart';
import '../presentation/pages/splash/splash_page.dart';
import '../presentation/pages/transactions/add_transaction_page.dart';
import '../presentation/pages/transactions/transactions_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: DashboardRoute.page,
        ),
        AutoRoute(
          page: InvestmentsRoute.page,
        ),
        AutoRoute(
          page: InvestmentDetailsRoute.page,
        ),
        AutoRoute(
          page: TransactionsRoute.page,
        ),
        AutoRoute(
          page: AddTransactionRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
      ];
} 