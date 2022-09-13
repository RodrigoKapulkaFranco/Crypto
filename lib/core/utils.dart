import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final visibleProvider = StateProvider(
  (ref) => true,
);

final numberFormatProvider = StateProvider(
  (ref) => NumberFormat.currency(
    locale: "pt_BR",
    decimalDigits: 2,
    name: "R\$",
  ),
);
