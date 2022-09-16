import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/utils.dart';
import '../utils/details_arguments.dart';
import '../widgets/line_chart.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(arguments.cripto.imagePath),
                ),
              ],
            ),
            Text(
              arguments.cripto.subtitle,
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
            CriptoLineChart(),
          ],
        ),
      ),
    );
  }
}
