// import 'dart:math';


import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesList extends ConsumerWidget {
  const ExpensesList({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(expenseProvider);
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.65),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              vertical: Theme.of(context).cardTheme.margin!.vertical),
        ),
        key: ValueKey(data[index]),
        // onDismissed: (direction) {
        //   onRemoveExpense(data[index]);
        // },
        child: ExpenseItem(
          index
        ),
      ),
    );
  }
}
