import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:shared_preferences/shared_preferences.dart';

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]) {
    _loadExpenses();
  }

  void remove(Expense expense) {
    state = state.where((e) => e.id != expense.id).toList();
  
    _saveExpense();
  }

  void add(Expense expenseData) {
    state = [...state, expenseData];
    _saveExpense();
  }

  Future<void> _saveExpense() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> expensejson =
          state.map((e) => e.toJson()).toList();
      print('expensejson data save----');
      print(expensejson);
      await prefs.setString('expenses', jsonEncode(expensejson));
      print('save success');
    } catch (error) {
      print('Error saving expenses: $error');
    }
  }

  Future<void> _loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? expensesJson = prefs.getString('expenses');
    print('expensejson----');
    print(expensesJson);
    if (expensesJson != null) {
      final List<dynamic> decoded = jsonDecode(expensesJson);
      state = decoded.map((json) => Expense.fromJson(json)).toList();
    } else {
      print('No expenses found to load.');
    }
  }
}
