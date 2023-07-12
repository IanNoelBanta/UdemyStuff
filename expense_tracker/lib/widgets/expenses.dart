import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addValidInputToList),
      constraints: const BoxConstraints(maxWidth: double.infinity),
    );
  }

  // void addValidInputToList(String title, double amount, DateTime date, Category category) {
  //   setState(() {
  //         _registeredExpenses.add(
  //       Expense(title: title, amount: amount, date: date, category: category));
  //   });
  // }

  void addValidInputToList(Expense validExpense) {
    setState(() {
      _registeredExpenses.add(validExpense);
    });
  }

  void removeValidInputFromList(Expense expense) {
    setState(() {
      var index = _registeredExpenses.indexOf(expense);

      _registeredExpenses.remove(expense);

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Removed'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(index, expense);
              });
            }),
      ));
    });
  }

  @override
  Widget build(context) {
    final currentWidth = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(child: Text('No Expenses Found!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: removeValidInputFromList,
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'), actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            color: kColorScheme.background,
          )
        ]),
        body: currentWidth < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ));
  }
}

// Expense Tracker App
// - Expenses Dashboard
//   - Toolbar with icon
//   - Chart
//   - List
// - Add expenses
//   - User Input
//     - Title
//     - Amount
//     - Date
//     - Type (Dropdown)
//   - Save
//   - Cancel
