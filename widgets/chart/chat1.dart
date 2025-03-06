import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chat1_bar.dart';

import 'package:flutter/material.dart';

class Chat1 extends StatelessWidget {
  const Chat1({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        // print("inner max total expense  " + bucket.totalExpenses.toString()  +  "max total expense" + maxTotalExpense.toString());
        maxTotalExpense = bucket.totalExpenses;
      }
        // print("outer max total expense  " + bucket.totalExpenses.toString()  +  "max total expense" + maxTotalExpense.toString());

    }

    // print(maxTotalExpense);
    return maxTotalExpense;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 209, 185, 235),
              const Color.fromARGB(255, 190, 96, 237),
            ],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
            
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                
                    Chat1Bar(fill: bucket.totalExpenses == 0
                          ? 0
                          : bucket.totalExpenses / maxTotalExpense,
                    ),
                    
            
                    
            
                    
              ],
                
            ),
          ),

SizedBox(height: 8,),
          //icon wala
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final bucket in buckets)
                Row(
                  children: [
                    Icon(
                      categoryIcons[bucket.category],
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
            ],



          ),
        ],
      ),
    );
  }
}
