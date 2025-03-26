import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_colors.dart';
import '../controller/cubit/home/home_cubit.dart';
import '../model/bill_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Text(state.failure.message);
          } else if (state is HomeLoaded) {
            final accountList = state.billList;
            return accountList.isEmpty
                ? const Center(child: Text('Sem Contas Cadastradas'))
                : ListView.builder(
                    itemCount: accountList.length,
                    itemBuilder: (context, index) {
                      final Bill singleBill = accountList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: Text(singleBill.name),
                            subtitle: Text(
                                '${singleBill.date.day.toString()}/${singleBill.date.month.toString()}/${singleBill.date.year.toString()}'),
                            trailing: Text(
                              'R\$ ${singleBill.total.toString()}',
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
          Navigator.pushNamed(context, '/transfer');
        },
      ),
    );
  }
}
