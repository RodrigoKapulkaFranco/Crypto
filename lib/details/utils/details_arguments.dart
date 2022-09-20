import 'package:decimal/decimal.dart';

import '../../shared/model/criptoViewData.dart';

class DetailsArguments {
  final CriptoViewData cripto;
  final Decimal userAmountCripto;
  DetailsArguments({
    required this.cripto,
    required this.userAmountCripto,
  });
}
