import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/shared/provider.dart';
import '../../shared/model/historyListRequisition.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/loading.dart';
import '../utils/details_arguments.dart';
import '../utils/providers/providers.dart';
import '../widgets/details_convert_button.dart';
import '../widgets/details_info_row.dart';
import '../widgets/line_chart.dart';

class DetailsPage extends HookConsumerWidget {
  static const routeName = "/details";
  final DetailsArguments arguments;
  const DetailsPage({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(
      historyListProvider(
        HistoryListRequisition(
          id: arguments.cripto.id,
          time: DateTime.now()
              .subtract(
                Duration(
                  days: ref.watch(selectDaysProvider),
                ),
              )
              .millisecondsSinceEpoch,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Detalhes"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              "/portifolio",
            );
          },
        ),
      ),
      body: history.when(
        data: (data) => SingleChildScrollView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    arguments.cripto.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    child: Image.network(
                      arguments.cripto.imagePath,
                      scale: 4,
                    ),
                  ),
                ],
              ),
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
              const Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                ),
                child: CriptoLineChart(),
              ),
              const Divider(thickness: 1),
              // DetailsInfoRow(
              //   title: 'Preço atual',
              //   value: numberFormat.format(ref.watch(valueCriptoProvider)),
              // ),
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Variação 24H',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                    // Variationinfo(variation: ref.watch(marketVariationProvider)),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              DetailsInfoRow(
                title: 'Quantidade',
                value: '${arguments.userAmountCripto}'
                    ' ${arguments.cripto.subtitle.toUpperCase()}',
              ),
              const Divider(thickness: 1),
              // DetailsInfoRow(
              //   title: 'Valor',
              //   value: numberFormat.format(
              //     DecimalIntl(
              //       Decimal.parse(ref.watch(valueCriptoProvider).toString()) *
              //           arguments.userAmountCripto,
              //     ),
              //   ),
              // ),
              const DetailsConvertButton(),
            ],
          ),
        ),
        error: (error, stackTrace) => const Center(
          child: Text('Um erro ocerreu!'),
        ),
        loading: () => const Loading(),
      ),
    );
  }
}
