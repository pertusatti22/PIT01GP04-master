import 'dart:developer';

import 'package:flutter/material.dart';

import '../features/account/view/accounts_page.dart';
import '../features/account/view/add_accounts_page.dart';
import '../features/dream/view/add_dreams_page.dart';
import '../features/dream/view/dreams_page.dart';
import '../features/expense/view/add_category_page.dart';
import '../features/expense/view/expenses_page.dart';
import '../features/home/view/add_transfer_page.dart';
import '../features/home/view/home_page.dart';
import '../features/splash/view/splash_page.dart';
import '../features/user/view/login_page.dart';
import '../features/user/view/profile_page.dart';
import '../features/user/view/register_page.dart';
import '../shared/widget/root_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('The Route is ${settings.name}');

    switch (settings.name) {
      case '/':
        return RootPage.route();
      case RootPage.routeName:
        return RootPage.route();
      case SplashPage.routeName:
        return SplashPage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case RegisterPage.routeName:
        return RegisterPage.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case AccountsPage.routeName:
        return AccountsPage.route();
      case AddAccountsPage.routeName:
        return AddAccountsPage.route();
      case AddDreamsPage.routeName:
        return AddDreamsPage.route();
      case AddTransferPage.routeName:
        return AddTransferPage.route();
      case DreamsPage.routeName:
        return DreamsPage.route();
      case ExpensesPage.routeName:
        return ExpensesPage.route();
      case AddCategoryPage.routeName:
        return AddCategoryPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Página não encontrada.'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
