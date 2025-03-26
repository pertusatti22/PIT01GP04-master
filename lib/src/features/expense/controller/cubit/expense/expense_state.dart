part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenseList;
  final List<Map<String, dynamic>> expenseChart;

  const ExpenseLoaded({
    required this.expenseList,
    required this.expenseChart,
  });

  @override
  List<Object> get props => [expenseList, expenseChart];
}

class ExpenseError extends ExpenseState {
  final Failure failure;

  const ExpenseError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
