import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/utils.dart';
import '../utils/details_arguments.dart';
import '../utils/providers/providers.dart';
import '../widgets/details_convert_button.dart';
import '../widgets/details_info_row.dart';
import '../widgets/line_chart.dart';
import '../widgets/variation_info.dart';

class DetailsPage extends HookConsumerWidget {
  static const routeName = "/details";

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;

    double getVariation(DetailsArguments arguments) {
      double hoje = ref.watch(historicoProvider)[0].y;
      double ontem = ref.watch(historicoProvider)[1].y;
      return hoje / ontem;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Detalhes"),
      ),
      body: SingleChildScrollView(
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
                  child: Image.asset(
                    arguments.cripto.imagePath,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                arguments.cripto.subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
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
              child: CriptoLineChart(),
            ),
            const Divider(thickness: 1),
            DetailsInfoRow(
              title: 'Preço atual',
              value: numberFormat.format(
                DecimalIntl(
                  arguments.cripto.criptoValue,
                ),
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
                  Variationinfo(variation: getVariation(arguments)),
                ],
              ),
            ),
            const Divider(thickness: 1),
            DetailsInfoRow(
              title: 'Quantidade',
              value: '${arguments.userAmountCripto}'
                  ' ${arguments.cripto.subtitle}',
            ),
            const Divider(thickness: 1),
            DetailsInfoRow(
              title: 'Valor',
              value: numberFormat.format(
                DecimalIntl(
                  arguments.cripto.userMoney(
                    arguments.userAmountCripto,
                  ),
                ),
              ),
            ),
            const DetailsConvertButton(),
          ],
        ),
      ),
    );
  }
}
