// test/widget_test.dart
// Este é um teste de widget do Flutter.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('O app inicia sem erros', (WidgetTester tester) async {
    // Constrói nosso app e aciona um frame.
    await tester.pumpWidget(const MyApp() as Widget);

    // Verifica se nosso app inicia na tela principal.
    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

class MyApp {
  const MyApp();
}