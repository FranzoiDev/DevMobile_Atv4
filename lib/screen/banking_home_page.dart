import 'package:flutter/material.dart';
import 'transaction_form_page.dart';
import 'transaction_list_page.dart';

class BankingHomePage extends StatefulWidget {
  const BankingHomePage({super.key});

  @override
  BankingHomePageState createState() => BankingHomePageState();
}

class BankingHomePageState extends State<BankingHomePage> {
  final List<String> _transactions = [];

  void _addTransaction(String transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _editTransaction(int index, String newTransaction) {
    setState(() {
      _transactions[index] = newTransaction;
    });
  }

  void _deleteTransaction(int index) {
    setState(() {
      _transactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionFormPage(
                      onAddTransaction: _addTransaction,
                    ),
                  ),
                );
              },
              child: const Text('Adicionar Transação'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionListPage(
                      transactions: _transactions,
                      onEditTransaction: _editTransaction,
                      onDeleteTransaction: _deleteTransaction,
                    ),
                  ),
                );
              },
              child: const Text('Ver Transações'),
            ),
          ],
        ),
      ),
    );
  }
}
