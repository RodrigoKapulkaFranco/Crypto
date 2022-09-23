import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/visible_provider.dart';

class HeaderTotalUserMoney extends HookConsumerWidget {
  const HeaderTotalUserMoney({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Cripto",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(visibleProvider.state).state = !visible;
          },
          icon: visible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ],
    );
  }
}