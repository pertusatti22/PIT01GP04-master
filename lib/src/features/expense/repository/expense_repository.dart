import '../model/expense_model.dart';
import '../service/expense_service.dart';

class ExpenseRepository {
  final ExpenseService expenseService;

  const ExpenseRepository({
    required this.expenseService,
  });

  Future<List<Expense>?> getExpenseList() async {
    final response = await expenseService.getExpenseData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map((singleExpense) => Expense.fromMap(singleExpense))
          .toList();
    }
    return null;
  }
}
