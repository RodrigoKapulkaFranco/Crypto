import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/providers/providers.dart';
import 'line_chart_button.dart';

class CriptoLineChart extends HookConsumerWidget {
  final List<FlSpot> history;
  const CriptoLineChart({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 8,
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
                  spots: history.sublist(
                    0,
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
    );
  }
}
