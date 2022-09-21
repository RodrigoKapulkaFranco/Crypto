import 'package:decimal/decimal.dart';

import '../../shared/model/cripto_view_data.dart';

class DetailsArguments {
  final CriptoViewData cripto;
  final Decimal userAmountCripto;
  DetailsArguments({
    required this.cripto,
    required this.userAmountCripto,
  });
}
