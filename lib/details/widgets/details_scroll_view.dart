import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/utils.dart';
import '../model/history_list_view_data.dart';
import '../utils/details_arguments.dart';
import '../utils/providers/providers.dart';
import 'details_convert_button.dart';
import 'details_info_row.dart';
import 'line_chart.dart';
import 'top_image_title.dart';
import 'variation_info.dart';

class DetailsScrollView extends HookConsumerWidget {
  const DetailsScrollView({
    Key? key,
    required this.arguments,
    required this.historyList,
  }) : super(key: key);

  final DetailsArguments arguments;
  final HistoryListViewData historyList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectDaysProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
        top: 16.0,
      ),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopImageTitle(arguments: arguments),
          Text(
            arguments.cripto.subtitle.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
          Text(
            numberFormat.format(
              DecimalIntl(
                arguments.cripto.criptoValue,
              ),
            ),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: CriptoLineChart(
              history: List<FlSpot>.from(
                historyList.prices.map(
                  (e) => FlSpot(
                    e[0].toDouble(),
                    e[1] as double,
                  ),
                ),
              ),
            ),
          ),
          const Divider(thickness: 1),
          DetailsInfoRow(
            title: 'Preço atual',
            value: numberFormat.format(
              historyList.prices[selectedDay - 1][1],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Variação 24H',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
                VariationInfo(
                  variation: historyList.prices[selectedDay - 1][1] /
                      historyList.prices[selectedDay][1],
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          DetailsInfoRow(
            title: 'Quantidade',
            value: '${arguments.userAmountCripto.toStringAsFixed(2)}'
                ' ${arguments.cripto.subtitle.toUpperCase()}',
          ),
          const Divider(thickness: 1),
          DetailsInfoRow(
            title: 'Valor',
            value: numberFormat.format(
              DecimalIntl(
                Decimal.parse(
                        historyList.prices[selectedDay - 1][1].toString()) *
                    arguments.userAmountCripto,
              ),
            ),
          ),
          const DetailsConvertButton(),
        ],
      ),
    );
  }
}
