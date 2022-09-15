import 'package:decimal/decimal.dart';

import '../../shared/model/cripto.dart';

class DetailsArguments {
  final Cripto cripto;
  final Decimal userAmountCripto;
  DetailsArguments({
    required this.cripto,
    required this.userAmountCripto,
  });
}
