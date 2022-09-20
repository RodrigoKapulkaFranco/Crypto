import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../details/utils/details_arguments.dart';
import '../../details/view/details_page.dart';

final numberFormat = NumberFormat.currency(
  locale: "pt_BR",
  decimalDigits: 2,
  name: "R\$",
);

final doubleFormat = NumberFormat("###.00", "en_US");

Route<dynamic>? getGenerateRoute(settings) {
  if (settings.name == '/details') {
    final args = settings.arguments as DetailsArguments;
    return MaterialPageRoute(
      builder: (context) => DetailsPage(arguments: args),
    );
  }
  return null;
}
