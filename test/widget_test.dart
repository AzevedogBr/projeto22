import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto22/presentation/home/bloc/home_cubit.dart';
import 'package:projeto22/presentation/home/widgets/check_card.dart';
import 'package:projeto22/presentation/home/widgets/range_card.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    home: Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SingleChildScrollView(child: child),
    ),
  );
}

void main() {
  group('CheckCard', () {
    testWidgets('shows no result when status is initial', (tester) async {
      await tester.pumpWidget(
        _wrap(
          CheckCard(
            status: CheckStatus.initial,
            checkedNumber: null,
            onSubmit: (_) {},
          ),
        ),
      );

      // AppCard aplica toUpperCase() no título
      expect(find.text('VERIFICAR NÚMERO'), findsOneWidget);
      expect(find.text('VERIFICAR'), findsOneWidget);
      // Nenhum badge de resultado deve aparecer no estado inicial
      expect(find.textContaining('é um número perfeito'), findsNothing);
    });

    testWidgets('shows success badge when number is perfect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          CheckCard(
            status: CheckStatus.perfect,
            checkedNumber: 6,
            onSubmit: (_) {},
          ),
        ),
      );

      expect(find.text('6 é um número perfeito!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('shows failure badge when number is not perfect', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          CheckCard(
            status: CheckStatus.notPerfect,
            checkedNumber: 10,
            onSubmit: (_) {},
          ),
        ),
      );

      expect(find.text('10 não é um número perfeito.'), findsOneWidget);
      expect(find.byIcon(Icons.cancel_rounded), findsOneWidget);
    });

    testWidgets('calls onSubmit with parsed number when button is tapped', (
      tester,
    ) async {
      int? submitted;
      await tester.pumpWidget(
        _wrap(
          CheckCard(
            status: CheckStatus.initial,
            checkedNumber: null,
            onSubmit: (n) => submitted = n,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), '28');
      await tester.tap(find.text('VERIFICAR'));
      await tester.pump();

      expect(submitted, equals(28));
    });
  });

  group('RangeCard', () {
    testWidgets('shows no result when status is initial', (tester) async {
      await tester.pumpWidget(
        _wrap(
          RangeCard(
            status: RangeStatus.initial,
            results: const [],
            onSubmit: (_, __) {},
          ),
        ),
      );

      // AppCard aplica toUpperCase() no título
      expect(find.text('BUSCAR EM INTERVALO'), findsOneWidget);
      expect(find.text('BUSCAR'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows loading indicator when status is loading', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          RangeCard(
            status: RangeStatus.loading,
            results: const [],
            onSubmit: (_, __) {},
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when start > end', (tester) async {
      await tester.pumpWidget(
        _wrap(
          RangeCard(
            status: RangeStatus.error,
            results: const [],
            onSubmit: (_, __) {},
          ),
        ),
      );

      expect(
        find.text('O valor inicial deve ser menor que o final.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('shows "none found" when done with empty results', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          RangeCard(
            status: RangeStatus.done,
            results: const [],
            onSubmit: (_, __) {},
          ),
        ),
      );

      expect(find.text('Nenhum número perfeito encontrado.'), findsOneWidget);
    });

    testWidgets('shows perfect numbers as chips when done with results', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          RangeCard(
            status: RangeStatus.done,
            results: const [6, 28],
            onSubmit: (_, __) {},
          ),
        ),
      );

      expect(find.text('6'), findsOneWidget);
      expect(find.text('28'), findsOneWidget);
      expect(find.text('2 números encontrados'), findsOneWidget);
    });
  });
}
