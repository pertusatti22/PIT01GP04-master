import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/splash/view/splash_page.dart';
import 'package:pit01gp04/src/features/user/controller/cubit/signup/sign_up_cubit.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';
import '../model/user_model.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ProfilePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onRedirect() {
      Navigator.of(context).pushNamed(SplashPage.routeName);
    }

    Future<void> onPressed() async {
      await context.read<SignUpCubit>().logOut();
      onRedirect();
    }

    const UserModel user = UserModel(id: 'id', name: 'John');

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
      body: SingleChildScrollView(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nome',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                    ],
                  ),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'E-mail',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                    ],
                  ),
                  Text(
                    'teste@teste.com',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Senha',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                    ],
                  ),
                  Text(
                    '*******',
                    style: Theme.of(context).textTheme.headline3,
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
                            'Sair',
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
      ),
    );
  }
}
