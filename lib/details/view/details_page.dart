import 'package:flutter/material.dart';

import '../utils/details_arguments.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arguments.cripto.title),
            Text(arguments.cripto.subtitle),
          ],
        ),
      ),
    );
  }
}
