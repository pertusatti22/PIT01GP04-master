import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/user/view/login_page.dart';
import 'package:pit01gp04/src/shared/widget/root_page.dart';

import '../../../utils/constants.dart';
import '../../user/controller/bloc/auth/auth_bloc.dart';
import '../widget/splash_logo.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SplashPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                LoginPage.routeName,
                ModalRoute.withName('/login'),
              ),
            );
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushNamed(RootPage.routeName),
            );
          }
        },
        child: Scaffold(
          body: SplashLogo(
            child: Center(
                child: Image.asset(
              logoDarkMode,
              height: 96,
            )),
          ),
        ),
      ),
    );
  }
}
