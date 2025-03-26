import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../model/failure.dart';
import '../../../model/expense_model.dart';
import '../../../repository/expense_repository.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseCubit({
    required this.expenseRepository,
  }) : super(ExpenseInitial());

  Future<void> fetchExpenses() async {
    emit(ExpenseLoading());
    try {
      final List<Expense>? expenseList =
          await expenseRepository.getExpenseList();
      if (expenseList == null) {
        return emit(const ExpenseLoaded(expenseList: [], expenseChart: []));
      }
      final expenseChart = expenseList.map(
        (expense) {
          return {
            "domain": expense.category,
            "measure": expense.total,
          };
        },
      ).toList();
      emit(ExpenseLoaded(expenseList: expenseList, expenseChart: expenseChart));
    } on Failure catch (err) {
      emit(ExpenseError(failure: err));
    } catch (e) {
      log('$e');
    }
  }
}
