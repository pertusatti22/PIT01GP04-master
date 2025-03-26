import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/account/controller/cubit/account/account_cubit.dart';
import 'package:pit01gp04/src/features/account/model/account_model.dart';

import '../../../theme/app_colors.dart';

class AccountsPage extends StatelessWidget {
  static const String routeName = '/accounts';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AccountsPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          if (state is AccountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AccountError) {
            return Text(state.failure.message);
          } else if (state is AccountLoaded) {
            final accountList = state.accountList;
            return accountList.isEmpty
                ? const Center(child: Text('Sem Contas Cadastradas'))
                : ListView.builder(
                    itemCount: accountList.length,
                    itemBuilder: (context, index) {
                      final Account singleAccount = accountList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: Text(singleAccount.title),
                            trailing: Text(
                              'R\$ ${singleAccount.balance.toString()}',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().primarySwatch.shade500,
        child: Icon(
          Icons.add,
          color: AppColors().primarySwatch.shade50,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/accounts/add');
        },
      ),
    );
  }
}
