import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/account/controller/cubit/account/account_cubit.dart';
import 'package:pit01gp04/src/features/account/repository/account_repository.dart';
import 'package:pit01gp04/src/features/account/service/account_service.dart';
import 'package:pit01gp04/src/features/expense/repository/expense_repository.dart';
import 'package:pit01gp04/src/features/expense/service/expense_service.dart';
import 'package:pit01gp04/src/features/home/controller/cubit/home/home_cubit.dart';
import 'package:pit01gp04/src/features/home/repository/home_repository.dart';
import 'package:pit01gp04/src/features/home/service/home_service.dart';

import 'features/dream/controller/cubit/dream/dream_cubit.dart';
import 'features/dream/repository/dream_repository.dart';
import 'features/dream/service/dream_service.dart';
import 'features/expense/controller/cubit/expense/expense_cubit.dart';
import 'features/splash/view/splash_page.dart';
import 'features/user/controller/bloc/auth/auth_bloc.dart';
import 'features/user/controller/bloc/register/register_bloc.dart';
import 'features/user/controller/cubit/login/login_cubit.dart';
import 'features/user/controller/cubit/signup/sign_up_cubit.dart';
import 'features/user/repository/auth_repository.dart';
import 'features/user/repository/database_repository.dart';
import 'theme/theme.dart';
import 'utils/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.dreamService,
    required this.accountService,
    required this.expenseService,
    required this.homeService,
  }) : super(key: key);

  final DreamService dreamService;
  final AccountService accountService;
  final ExpenseService expenseService;
  final HomeService homeService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => DreamRepository(
            dreamService: dreamService,
          ),
        ),
        RepositoryProvider(
          create: (context) => AccountRepository(
            accountService: accountService,
          ),
        ),
        RepositoryProvider(
          create: (context) => ExpenseRepository(
            expenseService: expenseService,
          ),
        ),
        RepositoryProvider(
          create: (context) => HomeRepository(
            homeService: homeService,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignUpCubit>(
            create: (context) =>
                SignUpCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(databaseRepository: DatabaseRepository()),
          ),
          BlocProvider<DreamCubit>(
            create: (context) => DreamCubit(
              dreamRepository: DreamRepository(dreamService: dreamService),
            )..fetchDreams(),
          ),
          BlocProvider<AccountCubit>(
            create: (context) => AccountCubit(
              accountRepository: AccountRepository(
                accountService: accountService,
              ),
            )..fetchAccounts(),
          ),
          BlocProvider<ExpenseCubit>(
            create: (context) => ExpenseCubit(
              expenseRepository: ExpenseRepository(
                expenseService: expenseService,
              ),
            )..fetchExpenses(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
              homeRepository: HomeRepository(
                homeService: homeService,
              ),
            )..fetchBills(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '4FIN',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashPage.routeName,
        ),
      ),
    );
  }
}
