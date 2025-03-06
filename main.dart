import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var kColorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 44, 6, 88));

var darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 7, 51, 37));

void main() {



    runApp(
    ProviderScope(
      child: MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: darkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkColorScheme.primaryContainer,
              foregroundColor: darkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
      
        theme: ThemeData().copyWith(
          // scaffoldBackgroundColor:Color.fromARGB(255, 29, 103, 164) ,
          colorScheme: kColorscheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorscheme.onPrimaryContainer,
            foregroundColor: kColorscheme.primaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorscheme.primaryContainer,
            ),
          ),
      
          cardTheme: const CardTheme().copyWith(
            color: Color.fromARGB(255, 165, 142, 180),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
      
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorscheme.onSecondaryContainer,
                    fontSize: 16),
              ),
        ),
        // card
        themeMode: ThemeMode.system,
      
        home: Expenses(),
      ),
    ),
  );
  // });
  
}
