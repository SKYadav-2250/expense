import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends ConsumerStatefulWidget {
  const Expenses({super.key});

  @override
  ConsumerState<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends ConsumerState<Expenses> {
  void _openExpenseOverLay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return FractionallySizedBox(
          widthFactor: 1,
          child: NewExpense(),
        );
      },
    );
  }

  // _saveExpenses();

  // void _removeExpense(Expense expense) {
  //   final expenseIndex = _registeredExpenses.indexOf(expense);
  //   // setState(() {
  //   //   _registeredExpenses.remove(expense);
  //   // });
  //   // _saveExpenses();

  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     duration: const Duration(seconds: 3),
  //     content: const Text('Expense deleted ..'),
  //     action: SnackBarAction(
  //       label: 'Undo',
  //       onPressed: () {
  //         setState(() {
  //           _registeredExpenses.insert(expenseIndex, expense);
  //         });
  //         // _saveExpenses();
  //       },
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final data = ref.watch(expenseProvider);

    Widget mainContent = const Center(
      child: Text('No data is available'),
    );

    if (data.isNotEmpty) {
      mainContent = ExpensesList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openExpenseOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: data),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: data),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
