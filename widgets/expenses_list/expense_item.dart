import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/provider/expense_provider.dart';

class ExpenseItem extends ConsumerWidget {
  const ExpenseItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expense = ref.watch(expenseProvider);
    return Card(

      
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text(
                expense[index].title,style: Theme.of(context).textTheme.titleLarge,
              
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '\$ ${ expense[index].amount.toStringAsFixed(2)}',
                  ),
                  Spacer(),

                  // Text('sumit kuar')
                  Icon(categoryIcons[ expense[index].category]),
                  const SizedBox(
                    width: 8,
                  ),

                  Text( expense[index].getformattedDate.toString())
                ],
              )
            ],
          )),
    );
  }
}
