import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/constants.dart';

class AddCategoryPage extends StatelessWidget {
  static const String routeName = '/category';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AddCategoryPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const AddCategoryPage({Key? key}) : super(key: key);

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
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors().primarySwatch.shade400,
                hintText: 'ESCOLHA UM ÍCONE PARA A CATEGORIA',
                contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
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
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors().primarySwatch.shade400,
                hintText: 'INSIRA O NOME DA CATEGORIA',
                contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
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
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'CADASTRAR',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
