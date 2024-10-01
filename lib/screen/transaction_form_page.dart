import 'package:flutter/material.dart';

class TransactionFormPage extends StatefulWidget {
  final Function(String) onAddTransaction;

  const TransactionFormPage({super.key, required this.onAddTransaction});

  @override
  State<TransactionFormPage> createState() => _TransactionFormPageState();
}

class _TransactionFormPageState extends State<TransactionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _transactionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onAddTransaction(_transactionController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Transação'),
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
              onPressed: _submitForm,
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
