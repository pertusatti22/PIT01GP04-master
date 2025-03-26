import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_colors.dart';
import '../controller/cubit/expense/expense_cubit.dart';

class ExpensesPage extends StatefulWidget {
  static const String routeName = '/expenses';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ExpensesPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpenseError) {
            return Text(state.failure.message);
          } else if (state is ExpenseLoaded) {
            final expenseList = state.expenseList;
            final expenseChart = state.expenseChart;
            return expenseList.isEmpty
                ? const Center(child: Text('Sem Contas Cadastradas'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: DChartPie(
                            data: expenseChart,
                            fillColor: (pieData, index) {
                              if (pieData['measure'] < 500) {
                                return AppColors().supportSwatch.shade300;
                              } else if (pieData['measure'] < 1000) {
                                return AppColors().supportSwatch.shade600;
                              } else {
                                return AppColors().supportSwatch.shade900;
                              }
                            },
                            donutWidth: 50,
                            labelColor: Colors.white,
                            labelFontSize: 14,
                            showLabelLine: false,
                          ),
                        ),
                        ...expenseList.map((singleExpense) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(singleExpense.category),
                                trailing: Text(
                                  'R\$ ${singleExpense.total.toString()}',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      ],
                    ),
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
          Navigator.pushNamed(context, '/category');
        },
      ),
    );
  }
}
