import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../details/utils/details_arguments.dart';
import '../../details/view/details_page.dart';
import '../../movements/view/movements_page.dart';
import '../../portfolio/view/portfolio_page.dart';
import '../../splash/view/splash_page.dart';

final numberFormat = NumberFormat.currency(
  locale: "pt_BR",
  decimalDigits: 2,
  name: "R\$",
);

final doubleFormat = NumberFormat("##0.00", "en_US");

Route<dynamic>? getGenerateRoute(settings) {
  if (settings.name == '/details') {
    final args = settings.arguments as DetailsArguments;
    return MaterialPageRoute(
      builder: (context) => DetailsPage(arguments: args),
    );
  } else if (settings.name == '/movements') {
    return MaterialPageRoute(
      builder: (context) => const MovementsPage(),
    );
  } else if (settings.name == '/portfolio') {
    return MaterialPageRoute(
      builder: (context) => const PortfolioPage(),
    );
  } else if (settings.name == '/splash') {
    return MaterialPageRoute(
      builder: (context) => const SplashPage(),
    );
  }
  return null;
}
