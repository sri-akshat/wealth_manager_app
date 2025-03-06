import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wealth_manager_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:wealth_manager_app/presentation/pages/dashboard/dashboard_home_page.dart';
import 'package:wealth_manager_app/presentation/pages/login/login_page.dart';
import 'package:wealth_manager_app/presentation/pages/auth/register_page.dart';
import 'package:wealth_manager_app/presentation/pages/splash/splash_page.dart';
import 'package:wealth_manager_app/presentation/pages/investments/investments_page.dart';
import 'package:wealth_manager_app/presentation/pages/investments/investment_details_page.dart';
import 'package:wealth_manager_app/presentation/pages/transactions/transactions_page.dart';
import 'package:wealth_manager_app/presentation/pages/transactions/add_transaction_page.dart';
import 'package:wealth_manager_app/presentation/pages/profile/profile_page.dart';

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
          children: [
            AutoRoute(
              page: DashboardHomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: InvestmentsRoute.page,
            ),
            AutoRoute(
              page: TransactionsRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: InvestmentDetailsRoute.page,
        ),
        AutoRoute(
          page: AddTransactionRoute.page,
        ),
      ];
} 