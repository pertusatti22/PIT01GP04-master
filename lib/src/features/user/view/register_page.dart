import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/shared/widget/root_page.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../controller/bloc/register/register_bloc.dart';
import '../controller/cubit/signup/sign_up_cubit.dart';
import '../model/user_model.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newName = '';
    bool temp = false;

    void onRedirect() {
      Navigator.of(context).pushNamed(RootPage.routeName);
    }

    void newUser(String name) {
      UserModel user = UserModel(
        id: context.read<SignUpCubit>().state.user!.uid,
        name: name,
      );
      context.read<RegisterBloc>().add(
            StartRegister(user: user),
          );
    }

    Future<void> onPressed() async {
      await context.read<SignUpCubit>().signUpWithCredentials();
      newUser(newName);
      onRedirect();
    }

    return Scaffold(
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
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
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return TextField(
                      onChanged: (value) {
                        newName = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors().primarySwatch.shade400,
                        hintText: 'INSIRA SEU NOME',
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
                        suffixIcon:
                            context.read<SignUpCubit>().state.isEmailValid
                                ? Icon(
                                    Icons.check,
                                    color: AppColors().secondarySwatch.shade900,
                                  )
                                : Icon(
                                    Icons.close,
                                    color: AppColors().supportSwatch.shade900,
                                  ),
                      ),
                    );
                  },
                ),
                TextField(
                  onChanged: (value) {
                    context.read<SignUpCubit>().emailChanged(value);
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
                    suffixIcon: context.read<SignUpCubit>().state.isEmailValid
                        ? Icon(
                            Icons.check,
                            color: AppColors().secondarySwatch.shade900,
                          )
                        : Icon(
                            Icons.close,
                            color: AppColors().supportSwatch.shade900,
                          ),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    context.read<SignUpCubit>().passwordChanged(value);
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
                    suffixIcon:
                        context.read<SignUpCubit>().state.isPasswordValid
                            ? Icon(
                                Icons.check,
                                color: AppColors().secondarySwatch.shade900,
                              )
                            : Icon(
                                Icons.close,
                                color: AppColors().supportSwatch.shade900,
                              ),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    temp = context.read<SignUpCubit>().passwordValidate(value)!;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors().primarySwatch.shade400,
                    hintText: 'CONFIRME SUA SENHA',
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
                    suffixIcon: temp
                        ? Icon(
                            Icons.check,
                            color: AppColors().secondarySwatch.shade900,
                          )
                        : Icon(
                            Icons.close,
                            color: AppColors().supportSwatch.shade900,
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
                      colors: temp
                          ? [
                              AppColors().secondarySwatch.shade900,
                              AppColors().secondarySwatch.shade600,
                            ]
                          : [
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
                    onPressed: temp ? onPressed : () {},
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: temp
                            ? Text(
                                'Registrar',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            : Text(
                                'Preencha todos os campos.',
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
