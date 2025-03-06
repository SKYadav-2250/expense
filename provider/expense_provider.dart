import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]);

  void add(String title, String amount, Category category, DateTime time) {
    final expenseData = Expense(
        title: title,
        amount: double.parse(amount),
        category: category,
        date: time);

    state = [...state, expenseData];
  }
}




