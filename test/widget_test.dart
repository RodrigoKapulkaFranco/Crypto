import 'package:cripto/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Test visibility button',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    },
  );

  testWidgets(
    'Test navegation',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('BTC'), findsOneWidget);
      expect(find.text('ETH'), findsOneWidget);
      expect(find.text('LTC'), findsOneWidget);
      expect(find.text('Bitcoin'), findsOneWidget);
      expect(find.text('Ethereum'), findsOneWidget);
      expect(find.text('Litecoin'), findsOneWidget);

      await tester.tap(find.text("Movimentações"));
      await tester.pump();

      expect(find.text('Ainda não implementado'), findsOneWidget);

      await tester.tap(find.text("Portifólio"));
      await tester.pump();

      expect(find.text('Cripto'), findsOneWidget);
      expect(find.text('Valor total de moedas'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_ios), findsWidgets);
    },
  );
}
