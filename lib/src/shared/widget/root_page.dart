import 'package:flutter/material.dart';

import '../../features/account/view/accounts_page.dart';
import '../../features/dream/view/dreams_page.dart';
import '../../features/expense/view/expenses_page.dart';
import '../../features/home/view/home_page.dart';
import '../../theme/app_colors.dart';
import '../../utils/constants.dart';

class RootPage extends StatefulWidget {
  static const String routeName = '/root';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RootPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              logoDarkMode,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              '4FIN',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.account_balance_wallet,
              color: AppColors().secondarySwatch.shade900,
            ),
            icon: const Icon(Icons.account_balance_wallet),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.pie_chart,
              color: AppColors().secondarySwatch.shade900,
            ),
            icon: const Icon(Icons.pie_chart),
            label: 'Despesas',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.rocket_launch,
              color: AppColors().secondarySwatch.shade900,
            ),
            icon: const Icon(Icons.rocket_launch),
            label: 'Sonhos',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.account_balance,
              color: AppColors().secondarySwatch.shade900,
            ),
            icon: const Icon(Icons.account_balance),
            label: 'Contas',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const ExpensesPage(),
        const DreamsPage(),
        const AccountsPage(),
      ][currentPageIndex],
    );
  }
}
