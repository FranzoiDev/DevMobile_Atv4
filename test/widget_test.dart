import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:banking_app/main.dart';

void main() {
  testWidgets('Deve adicionar uma transação ao clicar no botão', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: BankingHomePage()));
    
    final transactionField = find.byType(TextFormField);
    await tester.enterText(transactionField, '50.00');
    
    final addButton = find.text('Adicionar Transação');
    await tester.tap(addButton);

    await tester.pump();

    expect(find.text('50.00'), findsOneWidget);
  });

  testWidgets('Deve mostrar erro ao tentar adicionar transação sem valor', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: BankingHomePage()));

    final addButton = find.text('Adicionar Transação');
    await tester.tap(addButton);

    await tester.pump();

    expect(find.text('Por favor, insira um valor'), findsOneWidget);
  });

  testWidgets('Deve exibir a ListView após adicionar transações', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: BankingHomePage()));

    final transactionField = find.byType(TextFormField);
    await tester.enterText(transactionField, '100.00');
    await tester.tap(find.text('Adicionar Transação'));
    await tester.pump();

    await tester.enterText(transactionField, '200.00');
    await tester.tap(find.text('Adicionar Transação'));
    await tester.pump();

    expect(find.text('100.00'), findsOneWidget);
    expect(find.text('200.00'), findsOneWidget);
  });
}
