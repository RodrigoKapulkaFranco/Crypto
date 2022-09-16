import 'package:cripto/details/widgets/line_chart.dart';
import 'package:cripto/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Test visibility button',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    },
  );

  testWidgets(
    'Test navegation to movements page',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('BTC'), findsOneWidget);
      expect(find.text('ETH'), findsOneWidget);
      expect(find.text('LTC'), findsOneWidget);
      expect(find.text('Bitcoin'), findsOneWidget);
      expect(find.text('Ethereum'), findsOneWidget);
      expect(find.text('Litecoin'), findsOneWidget);

      await tester.tap(find.text("Movimentações"));
      await tester.pumpAndSettle();

      expect(find.text('Ainda não implementado'), findsOneWidget);

      await tester.tap(find.text("Portifólio"));
      await tester.pumpAndSettle();

      expect(find.text('Cripto'), findsOneWidget);
      expect(find.text('Valor total de moedas'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_ios), findsWidgets);
    },
  );

  testWidgets(
    'Testing navegation to details page',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('BTC'));
      await tester.pumpAndSettle();

      expect(find.text('Variação 24H'), findsOneWidget);
      expect(find.text('Bitcoin'), findsOneWidget);
      expect(find.text('BTC'), findsOneWidget);
      expect(find.byType(CriptoLineChart), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      await tester.tap(find.text('ETH'));
      await tester.pumpAndSettle();

      expect(find.text('Variação 24H'), findsOneWidget);
      expect(find.text('Ethereum'), findsOneWidget);
      expect(find.text('ETH'), findsOneWidget);
      expect(find.byType(CriptoLineChart), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      await tester.tap(find.text('LTC'));
      await tester.pumpAndSettle();

      expect(find.text('Variação 24H'), findsOneWidget);
      expect(find.text('Litecoin'), findsOneWidget);
      expect(find.text('LTC'), findsOneWidget);
      expect(find.byType(CriptoLineChart), findsOneWidget);
    },
  );
}
