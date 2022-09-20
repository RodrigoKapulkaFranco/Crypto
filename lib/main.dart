import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared/utils/route_definitions.dart';
import 'shared/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cripto',
        initialRoute: '/portifolio',
        routes: routes,
        onGenerateRoute: getGenerateRoute,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(224, 43, 87, 1),
        ),
      ),
    );
  }
}
