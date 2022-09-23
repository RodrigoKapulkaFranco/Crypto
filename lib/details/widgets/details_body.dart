import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/loading.dart';
import '../controller/providers.dart';
import '../utils/details_arguments.dart';
import 'details_scroll_view.dart';

class DetailsBody extends HookConsumerWidget {
  const DetailsBody({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(
        getHistoryProvider(
          arguments.cripto.id,
        ).future,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }
        return DetailsScrollView(
          arguments: arguments,
          historyList: snapshot.data!,
        );
      },
    );
  }
}
