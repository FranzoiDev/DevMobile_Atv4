import 'package:flutter/material.dart';

void main() {
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BankingHomePage(),
    );
  }
}

class BankingHomePage extends StatefulWidget {
  const BankingHomePage({super.key});

  @override
  BankingHomePageState createState() => BankingHomePageState();
}

class BankingHomePageState extends State<BankingHomePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _transactions = [];
  final TextEditingController _transactionController = TextEditingController();

  void _addTransaction() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _transactions.add(_transactionController.text);
        _transactionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _transactionController,
                decoration: const InputDecoration(
                  labelText: 'Digite o valor da transação',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addTransaction,
              child: const Text('Adicionar Transação'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_transactions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
