import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/providers.dart';
import 'line_chart_button.dart';

// Adicionar parâmetros do card 5
class CriptoLineChart extends HookConsumerWidget {
  CriptoLineChart({super.key});

  final List<FlSpot> historico = [];

  final Random _random = Random();

  List<FlSpot> getHistorico(int days) {
    return historico.sublist(0, days);
  }

  void dadosMockadosHistorico() {
    for (double i = 1; i <= 90; i++) {
      historico.add(FlSpot(i, _random.nextDouble() * 500));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dadosMockadosHistorico();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.cyan,
                    strokeWidth: 2,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: getHistorico(
                      ref.watch(selectDaysProvider),
                    ),
                    isCurved: false,
                    color: const Color.fromRGBO(
                      224,
                      43,
                      87,
                      1,
                    ),
                    dotData: FlDotData(show: false),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              LineChartButton(days: 5),
              LineChartButton(days: 15),
              LineChartButton(days: 30),
              LineChartButton(days: 45),
              LineChartButton(days: 90),
            ],
          ),
        ],
      ),
    );
  }
}
