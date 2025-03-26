import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/user/controller/cubit/login/login_cubit.dart';
import 'package:pit01gp04/src/features/user/view/register_page.dart';

import '../../../shared/widget/root_page.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LoginPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onRedirect() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RootPage.routeName, (routes) => false);
    }

    Future<void> onPressed() async {
      await context.read<LoginCubit>().logInWithCredentials();
      onRedirect();
    }

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logoDarkMode,
                      height: 48,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '4FIN',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                TextField(
                  onChanged: (email) {
                    context.read<LoginCubit>().emailChanged(email);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors().primarySwatch.shade400,
                    hintText: 'INSIRA SEU E-MAIL',
                    contentPadding:
                        const EdgeInsets.only(bottom: 5.0, top: 12.5),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors().primarySwatch.shade400,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors().primarySwatch.shade50,
                      ),
                    ),
                    suffixIcon: Icon(
                        context.read<LoginCubit>().state.isEmailValid
                            ? Icons.check
                            : Icons.close),
                  ),
                ),
                TextField(
                  onChanged: (password) {
                    context.read<LoginCubit>().passwordChanged(password);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors().primarySwatch.shade400,
                    hintText: 'INSIRA SUA SENHA',
                    contentPadding:
                        const EdgeInsets.only(bottom: 5.0, top: 12.5),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors().primarySwatch.shade400,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors().primarySwatch.shade50,
                      ),
                    ),
                    suffixIcon: Icon(
                        context.read<LoginCubit>().state.isPasswordValid
                            ? Icons.check
                            : Icons.close),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [
                        AppColors().secondarySwatch.shade900,
                        AppColors().secondarySwatch.shade600,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: onPressed,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Entrar',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: AppColors().secondarySwatch.shade900,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AppColors().primarySwatch.shade600,
                        AppColors().primarySwatch.shade200,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterPage.routeName);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Registrar-se',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
