import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/details_arguments.dart';
import '../widgets/details_body.dart';

class DetailsPage extends HookConsumerWidget {
  static const routeName = "/details";
  final DetailsArguments arguments;
  const DetailsPage({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Detalhes"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              "/portifolio",
            );
          },
        ),
      ),
      body: DetailsBody(
        arguments: arguments,
      ),
    );
  }
}
